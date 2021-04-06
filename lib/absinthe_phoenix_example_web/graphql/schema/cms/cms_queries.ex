defmodule AbsinthePhoenixExampleWeb.Schema.CMS.Queries do
  @moduledoc false

  use AbsinthePhoenixExampleWeb.Helper.GqlSchemaSuite

  object :cms_queries do
    field :post, :post do
      arg(:id, non_null(:id))
      resolve(&R.CMS.resolve_get_post/2)
    end

    field :posts, list_of(:post) do
      resolve(&R.CMS.resolve_get_posts/2)
    end
  end
end
