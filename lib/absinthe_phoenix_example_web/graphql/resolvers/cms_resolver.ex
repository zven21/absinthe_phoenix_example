defmodule AbsinthePhoenixExampleWeb.Resolvers.CMS do
  @moduledoc false

  alias AbsinthePhoenixExample.CMS

  @doc false
  def resolve_get_posts(_, _), do: {:ok, CMS.list_posts()}

  @doc false
  def resolve_get_post(%{id: id}, _), do: {:ok, CMS.get_post!(id)}

  @doc false
  def resolve_delete_post(_, %{id: id}, _info) do
    id
    |> CMS.get_post!()
    |> CMS.delete_post()
  end

  @doc false
  def resolve_create_post(_, %{post: post}, _), do: CMS.create_post(post)

  @doc false
  def resolve_update_post(_, %{id: id, post: post} = _args, _) do
    id
    |> CMS.get_post!()
    |> CMS.update_post(post)
  end
end
