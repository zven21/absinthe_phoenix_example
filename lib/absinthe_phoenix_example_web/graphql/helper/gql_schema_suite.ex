defmodule AbsinthePhoenixExampleWeb.Helper.GqlSchemaSuite do
  @moduledoc """
  helper for reduce boilerplate import/use/alias in absinthe schema
  """

  defmacro __using__(_opts) do
    quote do
      use Absinthe.Schema.Notation

      alias AbsinthePhoenixExampleWeb.Resolvers, as: R
      alias AbsinthePhoenixExampleWeb.Middleware, as: M
    end
  end
end
