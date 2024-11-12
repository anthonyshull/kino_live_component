# KinoLiveComponent

This kino allows you to render fully-styled Phoenix function and live components in [Livebook](https://livebook.dev).

## Installation

```elixir
def deps do
  [
    {:kino_live_component, ">= 0.0.0", only: :dev}
  ]
end
```

## Standalone

You can run KinoLiveComponent in standalone mode which means it will mount its own endpoint and render components using the base [Tailwind](https://tailwindcss.com/docs/installation/play-cdn) styles. You'll need to add configuration to your project:

```elixir
# config/dev.exs

config :kino_live_component, KinoLiveComponent.Endpoint,
  adapter: Bandit.PhoenixAdapter,
  http: [ip: {0, 0, 0, 0}, port: 9999],
  server: true,
  live_view: [signing_salt: "aaaaaaaa"],
  secret_key_base: String.duplicate("a", 64)
```

From Livebook:

```elixir
Kino.start_child(KinoLiveComponent.Endpoint)

import Phoenix.Component, only: [sigil_H: 2]

assigns = %{}

~H"""
<button class="px-3 py-2 bg-orange-500">Click me!</button>
""" |> KinoLiveComponent.component()
```

## Embedded (coming soon)

Or, if you have an existing Phoenix application and want to develop components with that applications's styles,
you can add KinoLiveComponent to your application's router.
