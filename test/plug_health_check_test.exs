defmodule PlugHealthCheckTest do
  use ExUnit.Case, async: true
  use Plug.Test
  doctest PlugHealthCheck

  defmodule DefaultPath do
    use Plug.Router
    plug PlugHealthCheck
    plug :match
    plug :dispatch
    match _, do: send_resp(conn, 200, "default")
  end

  defmodule CustomPath do
    use Plug.Router
    plug PlugHealthCheck, path: "/custom/path"
    plug :match
    plug :dispatch
    match _, do: send_resp(conn, 200, "custom")
  end

  test "default path" do
    conn = conn(:get, "/health/check") |> DefaultPath.call([])
    assert conn.status == 200
    assert conn.resp_body == "OK"
  end

  test "custom path" do
    conn = conn(:get, "/custom/path") |> CustomPath.call([])
    assert conn.status == 200
    assert conn.resp_body == "OK"
  end

  test "only matching requests are halted" do
    conn = conn(:get, "/random/path") |> DefaultPath.call([])
    assert conn.status == 200
    assert conn.resp_body == "default"

    conn = conn(:get, "/random/path") |> CustomPath.call([])
    assert conn.status == 200
    assert conn.resp_body == "custom"
  end
end
