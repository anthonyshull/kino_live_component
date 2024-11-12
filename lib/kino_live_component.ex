defmodule KinoLiveComponent do
  @moduledoc """
  """

  use Kino.JS

  import Phoenix.LiveViewTest

  @embedded Application.compile_env(:kino_live_component, :mount_point)
  @standalone Application.compile_env(:kino_live_component, KinoLiveComponent.Endpoint)[:http][:port]

  def component(heex) do
    Kino.JS.new(__MODULE__, html(heex))
  end

  def component(component, assigns) do
    Kino.JS.new(__MODULE__, render_component(component, assigns, router: KinoLiveComponent.Router))
  end

  defp html(heex) do
    heex
    |> Phoenix.HTML.html_escape()
    |> Phoenix.HTML.safe_to_string()
  end

  asset "main.js" do
    """
    export function init(ctx, html) {
      const embedded = "#{@embedded}";
      const standalone = "#{@standalone}";

      const liveView = embedded ? embedded : `http://localhost:${standalone}/kino-live-component/standalone`;

      const ifrm = document.createElement("iframe");

      ifrm.setAttribute("id", "kino-live-view");
      ifrm.setAttribute("src", liveView);

      ifrm.style.border = "0";
      ifrm.style.maxHeight = "500px";
      ifrm.style.overflow = "scroll";
      ifrm.style.width = "100%";

      ctx.root.appendChild(ifrm);

      ifrm.onload = () => {
        ifrm.contentWindow.postMessage(html, liveView);
      };
    }
    """
  end
end
