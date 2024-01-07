defmodule Taskboard.LandingTest do
  use Taskboard.DataCase

  alias Taskboard.Landing

  describe "homes" do
    alias Taskboard.Landing.Home

    import Taskboard.LandingFixtures

    @invalid_attrs %{}

    test "list_homes/0 returns all homes" do
      home = home_fixture()
      assert Landing.list_homes() == [home]
    end

    test "get_home!/1 returns the home with given id" do
      home = home_fixture()
      assert Landing.get_home!(home.id) == home
    end

    test "create_home/1 with valid data creates a home" do
      valid_attrs = %{}

      assert {:ok, %Home{} = home} = Landing.create_home(valid_attrs)
    end

    test "create_home/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Landing.create_home(@invalid_attrs)
    end

    test "update_home/2 with valid data updates the home" do
      home = home_fixture()
      update_attrs = %{}

      assert {:ok, %Home{} = home} = Landing.update_home(home, update_attrs)
    end

    test "update_home/2 with invalid data returns error changeset" do
      home = home_fixture()
      assert {:error, %Ecto.Changeset{}} = Landing.update_home(home, @invalid_attrs)
      assert home == Landing.get_home!(home.id)
    end

    test "delete_home/1 deletes the home" do
      home = home_fixture()
      assert {:ok, %Home{}} = Landing.delete_home(home)
      assert_raise Ecto.NoResultsError, fn -> Landing.get_home!(home.id) end
    end

    test "change_home/1 returns a home changeset" do
      home = home_fixture()
      assert %Ecto.Changeset{} = Landing.change_home(home)
    end
  end
end
