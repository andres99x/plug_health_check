defmodule PlugHealthCheck do
  @default_opts [path: "/health/check"]

  @moduledoc """
  Health Check endpoint plug.

  Responds with status **200 OK** and body `OK` to `GET` requests at an especific path.

  ## Options

    * `:path` - `[String]` the path to mount the plug. (Default: `#{@default_opts[:path]}`

  ## Examples

  ### Default Path

      defmodule WebApp do
        use Plug.builder
        plug PlugHealthCheck

        # ... rest of the code
      end

  ### Custom Path

      defmodule WebApp do
        use Plug.builder
        plug PlugHealthCheck, plug: "/health"

        # ... resto of the code
      end

  """

  @behaviour Plug
  import Plug.Conn

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
