defmodule AbsinthePhoenixExample.CMS.Utils.Loader do
  @moduledoc """
  dataloader for accounts
  """

  alias AbsinthePhoenixExample.Repo

  def data, do: Dataloader.Ecto.new(Repo, query: &query/2)

  def query(queryable, _args), do: queryable
end
