use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :blog, Blog.Endpoint,
  http: [port: 4000],
  https: [port: 4443,
          otp_app: :hello_phoenix,
          keyfile: "/etc/letsencrypt/live/www.test.club/privkey.pem",
          certfile: "/etc/letsencrypt/live/www.test.club/fullchain.pem"],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin",
                    cd: Path.expand("../", __DIR__)]]


# Watch static and templates for browser reloading.
config :blog, Blog.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :blog, Blog.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "elixir",
  password: "7BHp5ssDV181Iegd5Dj0YZmFlvWUgTnl",
  database: "blog",
  hostname: "localhost",
  pool_size: 10,
  port: 5432
