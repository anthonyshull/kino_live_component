defmodule KinoLiveComponent.MixProject do
  use Mix.Project

  def project do
    [
      app: :kino_live_component,
      deps: deps(),
      description: "A kino for rendering fully-styled function and live components in Livebook",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      package: package(),
      version: "0.0.5",
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
      {:bandit, "~> 1.6"},
      {:cors_plug, ">= 3.0.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:jason, "~> 1.4"},
      {:kino, "~> 0.14"},
      {:phoenix, "~> 1.7"},
      {:phoenix_html, "~> 4.2"},
      {:phoenix_live_view, "~> 1.0"},
      {:plug, "~> 1.16"}
    ]
  end

  defp package do
    [
      licenses: ["GPL-3.0-or-later"],
      links: %{"GitHub" => "https://github.com/anthonyshull/kino_live_component"},
    ]
  end
end
