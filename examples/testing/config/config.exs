# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :testing, TestingWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Wg1M3AH1ymQxMLW7mEMykGiGgIbvhP+tZt1Z/iCSxzmsRmxMgtl7/1jvVH6uusqp",
  render_errors: [view: TestingWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Testing.PubSub,
  live_view: [signing_salt: "Uuz0YrB7"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
