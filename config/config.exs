# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :av3_final,
  ecto_repos: [Av3Final.Repo]

# Configures the endpoint
config :av3_final, Av3FinalWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wsE4DgWsB6msa5Y3h96eIoxjXbJqmb16lmSR3sg+Aj0hrVYYPjoGrFfnqYAhwMhX",
  render_errors: [view: Av3FinalWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Av3Final.PubSub,
  live_view: [signing_salt: "HphoJ134"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
