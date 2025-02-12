import Config

config :cors_plug,
  origin: ["*"],
  max_age: 86400,
  methods: ["GET"]

config :kino_live_component, KinoLiveComponent.Endpoint,
  adapter: Bandit.PhoenixAdapter,
  http: [ip: {0, 0, 0, 0}, port: 9999],
  server: true,
  live_view: [signing_salt: "aaaaaaaa"],
  secret_key_base: String.duplicate("a", 64)

config :kino_live_component,
  css_path: "", # default: http://localhost:4000/assets/app.css
  endpoint: "http://localhost:9999/kino-live-component", # default http://localhost:4000/kino-live-component
  js_path: "https://cdn.tailwindcss.com" # default http://localhost:4000/assets/app.js
