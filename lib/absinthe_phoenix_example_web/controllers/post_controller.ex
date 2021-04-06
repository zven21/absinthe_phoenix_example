defmodule AbsinthePhoenixExampleWeb.PostController do
  @moduledoc false

  use AbsinthePhoenixExampleWeb, :controller

  use Absinthe.Phoenix.Controller,
    schema: AbsinthePhoenixExampleWeb.Schema,
    action: [mode: :internal]

  alias AbsinthePhoenixExample.CMS
  alias AbsinthePhoenixExample.CMS.Post

  @graphql """
    query {
      posts {
        id
        title
        body
      }
    }
  """
  def index(conn, %{data: data}) do
    render(conn, "index.html", posts: data.posts)
  end

  def new(conn, _params) do
    changeset = CMS.change_post(%Post{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"post" => post_params}) do
    case CMS.create_post(post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post created successfully.")
        |> redirect(to: Routes.post_path(conn, :show, post))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  @graphql """
    query($id: ID!) {
      post(id: $id) {
        id
        title
        body
      }
    }
  """
  def show(conn, %{data: data}) do
    # post = CMS.get_post!(id)
    render(conn, "show.html", post: data.post)
  end

  def edit(conn, %{"id" => id}) do
    post = CMS.get_post!(id)
    changeset = CMS.change_post(post)
    render(conn, "edit.html", post: post, changeset: changeset)
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = CMS.get_post!(id)

    case CMS.update_post(post, post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post updated successfully.")
        |> redirect(to: Routes.post_path(conn, :show, post))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", post: post, changeset: changeset)
    end
  end

  @graphql """
  mutation ($id: ID) {
    delete_post (id: $id) {
      id
    }
  }
  """
  def delete(conn, %{data: data}) do
    case data.delete_post do
      nil ->
        conn

      _value ->
        conn
        |> put_flash(:info, "Post deleted successfully.")
        |> redirect(to: Routes.post_path(conn, :index))
    end
  end
end
