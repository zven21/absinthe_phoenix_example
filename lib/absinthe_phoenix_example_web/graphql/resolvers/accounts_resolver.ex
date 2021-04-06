defmodule AbsinthePhoenixExampleWeb.Resolvers.CMS do
  @moduledoc false

  alias AbsinthePhoenixExample.CMS

  @doc false
  def resolve_get_post(%{id: id}, _), do: CMS.get_post(id)

  @doc false
  def resolve_delete_post(_, %{id: id}, _info) do
    id
    |> CMS.get_post!()
    |> CMS.delete_post()
  end

  @doc false
  def resolve_create_post(_, args, _), do: CMS.create_post(args)

  @doc false
  def resolve_update_post(_, %{id: id} = args, _) do
    id
    |> CMS.get_post!()
    |> CMS.update_post(args)
  end
end
