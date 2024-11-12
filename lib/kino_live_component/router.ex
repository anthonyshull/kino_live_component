defmodule KinoLiveComponent.Router do
  @moduledoc """
  """

  use Phoenix.Router, helpers: false

  import Phoenix.LiveView.Router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:protect_from_forgery)
    plug(:put_insecure_headers)
  end

  scope "/", KinoLiveComponent do
    pipe_through(:browser)

    live("/kino-live-view", Live.Index)
  end

  defp put_insecure_headers(conn, _) do
    conn
    |> put_resp_header("access-control-allow-origin", "*")
    |> put_resp_header("content-security-policy", "frame-ancestors *;")
  end
end
