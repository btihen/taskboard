defmodule Taskboard.LandingFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Taskboard.Landing` context.
  """

  @doc """
  Generate a home.
  """
  def home_fixture(attrs \\ %{}) do
    {:ok, home} =
      attrs
      |> Enum.into(%{

      })
      |> Taskboard.Landing.create_home()

    home
  end
end
