defmodule KinoLiveComponent.Endpoint do
  @moduledoc """
  """

  use Phoenix.Endpoint, otp_app: :kino_live_component

  @session_options [
    store: :cookie,
    key: "_kino_live_component_key",
    signing_salt: "fK8TN2rH",
    same_site: "Lax"
  ]

  socket "/live", Phoenix.LiveView.Socket,
    websocket: [connect_info: [session: @session_options]],
    longpoll: [connect_info: [session: @session_options]]

  plug Plug.Session, @session_options
  plug CORSPlug
  plug KinoLiveComponent.Router
end
