# KinoLiveView

This kino allows you to render fully-styled Phoenix function and live components in [Livebook](https://livebook.dev).

## Installation

```elixir
def deps do
  [
    {:kino_live_view, ">= 0.0.0", only: :dev}
  ]
end
```

## Standalone

You can run KinoLiveView in standalone mode which means it will mount its own endpoint and render components using the base [Tailwind](https://tailwindcss.com/docs/installation/play-cdn) styles.

From Livebook:

```elixir
Kino.start_child(KinoLiveView.Endpoint)

import Phoenix.Component, only: [sigil_H: 2]

assigns = %{}

~H"""
<button class="px-3 py-2 bg-orange-500">Click me!</button>
""" |> KinoLiveView.component()
```

## Embedded (coming soon)

Or, if you have an existing Phoenix application and want to develop components with that applications's styles,
you can add KinoLiveView to your application's router.
