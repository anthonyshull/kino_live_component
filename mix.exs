defmodule KinoLiveView.MixProject do
  use Mix.Project

  def project do
    [
      app: :kino_live_view,
      version: "0.0.1",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:bandit, "1.5.7"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:jason, "1.4.4"},
      {:kino, "0.14.2"},
      {:phoenix, "1.7.14"},
      {:phoenix_html, "4.1.1"},
      {:phoenix_live_view, "1.0.0-rc.7"}
    ]
  end
end
