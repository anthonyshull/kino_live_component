defmodule KinoLiveView.Endpoint do
  @moduledoc """
  """

  use Phoenix.Endpoint, otp_app: :kino_live_view

  @session_options [
    store: :cookie,
    key: "_kino_live_view_key",
    signing_salt: "fK8TN2rH",
    same_site: "Lax"
  ]

  socket "/live", Phoenix.LiveView.Socket,
    websocket: [connect_info: [session: @session_options]],
    longpoll: [connect_info: [session: @session_options]]

  plug Plug.Session, @session_options
  plug KinoLiveView.Router
end
