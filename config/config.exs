# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :mthomps4,
  ecto_repos: [Mthomps4.Repo]

# Configures the endpoint
config :mthomps4, Mthomps4Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8Hfu3s8a4F+cNGfv6UrfJ/fspxcW1mtFnRKPUa3rvIGmI52MDGAeN7RcjBXD0N00",
  render_errors: [view: Mthomps4Web.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Mthomps4.PubSub,
  live_view: [signing_salt: "LQAoI0FQ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
