defmodule TaskboardWeb.Admin.ProjectLive.Index do
  use TaskboardWeb, :live_view

  alias Taskboard.Core.Programs
  alias Taskboard.Core.Programs.Project
  import TaskboardWeb.Components.EmptyState, only: [empty_state: 1]

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :projects, Programs.list_projects())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Project")
    |> assign(:project, Programs.get_project!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Project")
    |> assign(:project, %Project{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Projects")
    |> assign(:project, nil)
  end

  @impl true
  def handle_info({TaskboardWeb.Admin.ProjectLive.FormComponent, {:saved, project}}, socket) do
    {:noreply, stream_insert(socket, :projects, project)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    project = Programs.get_project!(id)
    {:ok, _} = Programs.delete_project(project)

    {:noreply, stream_delete(socket, :projects, project)}
  end
end
