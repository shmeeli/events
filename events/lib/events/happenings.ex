defmodule Events.Happenings do
  @moduledoc """
  The Happenings context.
  """

  import Ecto.Query, warn: false
  alias Events.Repo

  alias Events.Happenings.Happening

  @doc """
  Returns the list of happening.

  ## Examples

      iex> list_happening()
      [%Happening{}, ...]

  """
  def list_happening do
    Repo.all(Happening)
  end
  def list_happening do
    Repo.all(Happening)
    |> Repo.preload(:user)
  end

  def list_happenings do
    Repo.all(Happening)
    |> Repo.preload(:user)
  end

  @doc """
  Gets a single happening.

  Raises `Ecto.NoResultsError` if the Happening does not exist.

  ## Examples

      iex> get_happening!(123)
      %Happening{}

      iex> get_happening!(456)
      ** (Ecto.NoResultsError)

  """
  def get_happening!(id) do
    Repo.get!(Happening, id)
    |> Repo.preload(:user)
  end

  @doc """
  Creates a happening.

  ## Examples

      iex> create_happening(%{field: value})
      {:ok, %Happening{}}

      iex> create_happening(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_happening(attrs \\ %{}) do
    %Happening{}
    |> Happening.changeset(attrs)
    |> Repo.insert()
  end

  def load_comments(%Happening{} = happening) do
    Repo.preload(happening, [comments: :user])
  end

  def get_comment_by_id(user_id) do
    query = from(h in Happening, where: h.user_id == ^user_id, select: h)
    #Repo.get_by(Happening, user_id: user_id)
    Repo.all(query)
  end

  @doc """
  Updates a happening.

  ## Examples

      iex> update_happening(happening, %{field: new_value})
      {:ok, %Happening{}}

      iex> update_happening(happening, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_happening(%Happening{} = happening, attrs) do
    happening
    |> Happening.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a happening.

  ## Examples

      iex> delete_happening(happening)
      {:ok, %Happening{}}

      iex> delete_happening(happening)
      {:error, %Ecto.Changeset{}}

  """
  def delete_happening(%Happening{} = happening) do
    Repo.delete(happening)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking happening changes.

  ## Examples

      iex> change_happening(happening)
      %Ecto.Changeset{data: %Happening{}}

  """
  def change_happening(%Happening{} = happening, attrs \\ %{}) do
    Happening.changeset(happening, attrs)
  end
end
