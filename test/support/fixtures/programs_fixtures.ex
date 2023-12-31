defmodule Taskboard.Core.ProgramsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Taskboard.Core.Programs` context.
  """

  @doc """
  Generate a project.
  """
  def project_fixture(attrs \\ %{}) do
    {:ok, project} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> Taskboard.Core.Programs.create_project()

    project
  end
end
