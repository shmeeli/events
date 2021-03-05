defmodule EventsWeb.HappeningController do
  use EventsWeb, :controller

  alias Events.Happenings
  alias Events.Happenings.Happening

  def index(conn, _params) do
    happening = Happenings.list_happening()
    render(conn, "index.html", happening: happening)
  end

  def new(conn, _params) do
    changeset = Happenings.change_happening(%Happening{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"happening" => happening_params}) do
    case Happenings.create_happening(happening_params) do
      {:ok, happening} ->
        conn
        |> put_flash(:info, "Happening created successfully.")
        |> redirect(to: Routes.happening_path(conn, :show, happening))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    happening = Happenings.get_happening!(id)
    render(conn, "show.html", happening: happening)
  end

  def edit(conn, %{"id" => id}) do
    happening = Happenings.get_happening!(id)
    changeset = Happenings.change_happening(happening)
    render(conn, "edit.html", happening: happening, changeset: changeset)
  end

  def update(conn, %{"id" => id, "happening" => happening_params}) do
    happening = Happenings.get_happening!(id)

    case Happenings.update_happening(happening, happening_params) do
      {:ok, happening} ->
        conn
        |> put_flash(:info, "Happening updated successfully.")
        |> redirect(to: Routes.happening_path(conn, :show, happening))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", happening: happening, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    happening = Happenings.get_happening!(id)
    {:ok, _happening} = Happenings.delete_happening(happening)

    conn
    |> put_flash(:info, "Happening deleted successfully.")
    |> redirect(to: Routes.happening_path(conn, :index))
  end
end
