import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :svelte_phoenix, SveltePhoenixWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "GBb94p5OnC/I4Zvo4diUreHG9y5AmDf26VZb4vepE/t6Bw6PhnSxGs6ITgbuVphl",
  server: false

# In test we don't send emails.
config :svelte_phoenix, SveltePhoenix.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
