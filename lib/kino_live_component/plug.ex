defmodule KinoLiveComponent.Plug do
  @moduledoc """
  """

  use Phoenix.Router, helpers: false

  def allow_insecure_connection(conn, _opts) do
    conn
    |> accepts(["html"])
    |> fetch_session()
    |> protect_from_forgery()
    |> put_resp_header("access-control-allow-origin", "*")
    |> put_resp_header("content-security-policy", "frame-ancestors *;")
  end
end
