# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :absinthe_phoenix_example,
  ecto_repos: [AbsinthePhoenixExample.Repo]

# Configures the endpoint
config :absinthe_phoenix_example, AbsinthePhoenixExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KIy0s5DreHSCQGdlMFqm9eUxCyP2FlL1LKo2rHbvDmGUxdVt7EApz2s6ijc4UBcv",
  render_errors: [
    view: AbsinthePhoenixExampleWeb.ErrorView,
    accepts: ~w(html json),
    layout: false
  ],
  pubsub_server: AbsinthePhoenixExample.PubSub,
  live_view: [signing_salt: "D6AMNWoc"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
