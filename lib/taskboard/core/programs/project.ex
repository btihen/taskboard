defmodule Taskboard.Core.Programs.Project do
  use Ecto.Schema
  import Ecto.Changeset
  alias Taskboard.Core.Accounts.User

  schema "projects" do
    field :description, :string
    field :title, :string
    # remove this (not needed)
    # field :owner_id, :id

    # use this for relationship and custom association name
    belongs_to :owner, User, [foreign_key: :owner_id]

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(project, attrs) do
    # add the owner_id to the required attributes since it must be present
    project
    |> cast(attrs, [:title, :description, :owner_id])
    |> validate_required([:title, :description, :owner_id])
    # old changeset
    # |> cast(attrs, [:title, :description])
    # |> validate_required([:title, :description])
  end
end
