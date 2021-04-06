defmodule AbsinthePhoenixExampleWeb.Schema.CMS.Mutations.Post do
  @moduledoc false

  use AbsinthePhoenixExampleWeb.Helper.GqlSchemaSuite

  object :cms_post_mutations do
    field :create_post, :post do
      arg(:post, non_null(:post_args))

      resolve(&R.CMS.resolve_create_post/3)
    end

    field :update_post, :post do
      arg(:id, non_null(:id))
      arg(:post, non_null(:post_args))
      # arg(:title, non_null(:string))
      # arg(:body, non_null(:string))

      resolve(&R.CMS.resolve_update_post/3)
    end

    field :delete_post, :post do
      arg(:id, non_null(:id))

      resolve(&R.CMS.resolve_delete_post/3)
    end
  end
end
