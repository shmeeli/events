defmodule EventsWeb.HappeningControllerTest do
  use EventsWeb.ConnCase

  alias Events.Happenings

  @create_attrs %{date: "some date", desc: "some desc", name: "some name"}
  @update_attrs %{date: "some updated date", desc: "some updated desc", name: "some updated name"}
  @invalid_attrs %{date: nil, desc: nil, name: nil}

  def fixture(:happening) do
    {:ok, happening} = Happenings.create_happening(@create_attrs)
    happening
  end

  describe "index" do
    test "lists all happening", %{conn: conn} do
      conn = get(conn, Routes.happening_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Happening"
    end
  end

  describe "new happening" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.happening_path(conn, :new))
      assert html_response(conn, 200) =~ "New Happening"
    end
  end

  describe "create happening" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.happening_path(conn, :create), happening: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.happening_path(conn, :show, id)

      conn = get(conn, Routes.happening_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Happening"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.happening_path(conn, :create), happening: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Happening"
    end
  end

  describe "edit happening" do
    setup [:create_happening]

    test "renders form for editing chosen happening", %{conn: conn, happening: happening} do
      conn = get(conn, Routes.happening_path(conn, :edit, happening))
      assert html_response(conn, 200) =~ "Edit Happening"
    end
  end

  describe "update happening" do
    setup [:create_happening]

    test "redirects when data is valid", %{conn: conn, happening: happening} do
      conn = put(conn, Routes.happening_path(conn, :update, happening), happening: @update_attrs)
      assert redirected_to(conn) == Routes.happening_path(conn, :show, happening)

      conn = get(conn, Routes.happening_path(conn, :show, happening))
      assert html_response(conn, 200) =~ "some updated date"
    end

    test "renders errors when data is invalid", %{conn: conn, happening: happening} do
      conn = put(conn, Routes.happening_path(conn, :update, happening), happening: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Happening"
    end
  end

  describe "delete happening" do
    setup [:create_happening]

    test "deletes chosen happening", %{conn: conn, happening: happening} do
      conn = delete(conn, Routes.happening_path(conn, :delete, happening))
      assert redirected_to(conn) == Routes.happening_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.happening_path(conn, :show, happening))
      end
    end
  end

  defp create_happening(_) do
    happening = fixture(:happening)
    %{happening: happening}
  end
end
