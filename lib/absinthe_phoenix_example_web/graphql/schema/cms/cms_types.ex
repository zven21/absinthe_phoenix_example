defmodule AbsinthePhoenixExampleWeb.Schema.CMS.Types do
  @moduledoc false

  use AbsinthePhoenixExampleWeb.Helper.GqlSchemaSuite

  object :post do
    field :id, :id
    field :title, :string
    field :body, :string
  end
end
