defmodule AbsinthePhoenixExample.Factory do
  @moduledoc false

  use ExMachina.Ecto, repo: AbsinthePhoenixExample.Repo

  alias AbsinthePhoenixExample.CMS.Post

  def post_factory() do
    %Post{
      title: sequence(:title, &"title_#{&1}"),
      body: sequence(:body, &"body_#{&1}")
    }
  end
end
