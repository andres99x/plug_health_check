defmodule PlugHealthCheck do
  import Plug.Conn

  @default_opts [path: "/health/check"]

  def init(opts), do: Keyword.merge(@default_opts, opts)

  def call(%Plug.Conn{request_path: request_path} = conn, [{:path, path} | _] = _opts) do
    case request_path do
      ^path ->
        conn
        |> send_resp(200, "OK")
        |> halt
      _ ->
        conn
    end
  end
end
