defmodule AbsinthePhoenixExample.Repo do
  use Ecto.Repo,
    otp_app: :absinthe_phoenix_example,
    adapter: Ecto.Adapters.Postgres
end
