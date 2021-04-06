defmodule AbsinthePhoenixExampleWeb.Schema.CMS.Types do
  @moduledoc false

  use AbsinthePhoenixExampleWeb.Helper.GqlSchemaSuite

  object :post do
    field :id, :id
    field :title, :string
    field :body, :string
  end

  # input_object :post_filter do
  #   field :name_matches, :string
  #   field :age_above, :integer
  #   field :age_below, :integer
  # end
end
