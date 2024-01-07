defmodule TaskboardWeb.HomeLiveTest do
  use TaskboardWeb.ConnCase

  import Phoenix.LiveViewTest
  import Taskboard.LandingFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  defp create_home(_) do
    home = home_fixture()
    %{home: home}
  end

  describe "Index" do
    setup [:create_home]

    test "lists all homes", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/homes")

      assert html =~ "Listing Homes"
    end

    test "saves new home", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/homes")

      assert index_live |> element("a", "New Home") |> render_click() =~
               "New Home"

      assert_patch(index_live, ~p"/homes/new")

      assert index_live
             |> form("#home-form", home: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#home-form", home: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/homes")

      html = render(index_live)
      assert html =~ "Home created successfully"
    end

    test "updates home in listing", %{conn: conn, home: home} do
      {:ok, index_live, _html} = live(conn, ~p"/homes")

      assert index_live |> element("#homes-#{home.id} a", "Edit") |> render_click() =~
               "Edit Home"

      assert_patch(index_live, ~p"/homes/#{home}/edit")

      assert index_live
             |> form("#home-form", home: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#home-form", home: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/homes")

      html = render(index_live)
      assert html =~ "Home updated successfully"
    end

    test "deletes home in listing", %{conn: conn, home: home} do
      {:ok, index_live, _html} = live(conn, ~p"/homes")

      assert index_live |> element("#homes-#{home.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#homes-#{home.id}")
    end
  end

  describe "Show" do
    setup [:create_home]

    test "displays home", %{conn: conn, home: home} do
      {:ok, _show_live, html} = live(conn, ~p"/homes/#{home}")

      assert html =~ "Show Home"
    end

    test "updates home within modal", %{conn: conn, home: home} do
      {:ok, show_live, _html} = live(conn, ~p"/homes/#{home}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Home"

      assert_patch(show_live, ~p"/homes/#{home}/show/edit")

      assert show_live
             |> form("#home-form", home: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#home-form", home: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/homes/#{home}")

      html = render(show_live)
      assert html =~ "Home updated successfully"
    end
  end
end
