# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :redis_test, RedisTest.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "VL1OnWA36yaJ9hN9kyHzHrvqYfwOCJL0AGRx0hjBYXgSwjbOBgmWF3LbmqG9tsHa",
  render_errors: [accepts: ~w(html json)],
  # pubsub: [name: RedisTest.PubSub,
  #          adapter: Phoenix.PubSub.PG2]
  pubsub: [name:    RedisTest.PubSub,
           redis_pool_size: 5,
           adapter: Phoenix.PubSub.Redis,
           host: "127.0.0.1"
          ]


# Configures Elixir's Logger
  config :logger,
  backends: [:console],
  handle_sasl_reports: true,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id],
  level: :debug

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false
