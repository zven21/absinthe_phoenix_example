defmodule AbsinthePhoenixExampleWeb.Helper.Utils do
  @moduledoc """
  抽象方法集。
  """

  @doc """
  see: https://hexdocs.pm/absinthe/errors.html#content for error format
  """
  def handle_absinthe_error(resolution, err_msg) when is_list(err_msg) do
    # %{resolution | value: [], errors: transform_errors(changeset)}
    resolution
    |> Absinthe.Resolution.put_result({:error, message: err_msg})
  end

  def handle_absinthe_error(resolution, err_msg) when is_binary(err_msg) do
    resolution
    |> Absinthe.Resolution.put_result({:error, message: err_msg})
  end
end
