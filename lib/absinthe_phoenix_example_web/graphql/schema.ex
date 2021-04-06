defmodule AbsinthePhoenixExampleWeb.Schema do
  use Absinthe.Schema

  alias AbsinthePhoenixExampleWeb.Schema.CMS

  # import_types(Util.CommonTypes)

  # types
  import_types(Absinthe.Type.Custom)

  # Accounts
  import_types(CMS.Types)
  import_types(CMS.Queries)
  import_types(CMS.Mutations.Post)

  @desc "the root of query."
  query do
    import_fields(:cms_queries)
  end

  @desc "the root of mutation."
  mutation do
    import_fields(:cms_post_mutations)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end

  def dataloader do
    alias AbsinthePhoenixExample.CMS

    Dataloader.new()
    |> Dataloader.add_source(CMS, CMS.Utils.Loader.data())
  end

  def context(ctx) do
    ctx |> Map.put(:loader, dataloader())
  end
end
