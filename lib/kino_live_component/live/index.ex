defmodule KinoLiveComponent.Live.Index do
  @moduledoc """
  """

  require Logger

  use Phoenix.LiveView, layout: {__MODULE__, :live}

  @css_path Application.compile_env(:kino_live_component, :css_path, "/assets/app.css")
  @js_path Application.compile_env(:kino_live_component, :js_path, "/assets/app.js")

  def render("live.html", assigns) do
    assigns =
      assigns
      |> assign(:css_path, @css_path)
      |> assign(:js_path, @js_path)

    ~H"""
    <meta name="csrf-token" content={Plug.CSRFProtection.get_csrf_token()} />
    <link rel="stylesheet" href={@css_path}>
    <script src={@js_path}></script>
    <script>
      window.addEventListener("message", event => {
        setTimeout(() => {
          document.getElementById("kino-live-view-container").innerHTML = event.data;

          document.querySelectorAll("[phx-hook]").forEach(el => {
            window.liveSocket.main.maybeAddNewHook(el);
          });
        }, 500);
      });
    </script>
    <%= @inner_content %>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div id="kino-live-view-wrapper" style="background: #EFEFEF; border: 1px solid #EEE; border-radius: 0.5rem; padding: 10px;">
      <div id="kino-live-view-container" style="display: flex; justify-content: center;">
      </div>
    </div>
    """
  end

  def handle_event(event, params, socket) do
    Logger.info(event, params)

    {:noreply, socket}
  end
end
