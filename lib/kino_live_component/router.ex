defmodule KinoLiveComponent.Router do
  @moduledoc """
  """

  use Phoenix.Router, helpers: false

  import Phoenix.LiveView.Router
  import KinoLiveComponent.Plug, only: [allow_insecure_connection: 2]

  scope "/", KinoLiveComponent do
    pipe_through :allow_insecure_connection

    live("/kino-live-component", Live.Index)
  end
end
