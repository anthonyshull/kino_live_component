defmodule KinoLiveComponent.Live.Index do
  @moduledoc """
  """

  use Phoenix.LiveView, layout: {__MODULE__, :live}

  def render("live.html", assigns) do
    ~H"""
    <meta name="csrf-token" content={Plug.CSRFProtection.get_csrf_token()} />
    <script src="https://cdn.jsdelivr.net/npm/phoenix@1.7.1/priv/static/phoenix.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/phoenix_live_view@0.18.17/priv/static/phoenix_live_view.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
      let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");
      let liveSocket = new window.LiveView.LiveSocket("/live", window.Phoenix.Socket, {params: {_csrf_token: csrfToken}})
      liveSocket.connect()

      window.addEventListener("message", event => {
        setTimeout(() => {
          document.getElementById("kino-live-view-container").innerHTML = event.data;
          document.querySelectorAll("[phx-hook]").forEach(el => {
            liveSocket.main.maybeAddNewHook(el);
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
end
