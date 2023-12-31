defmodule TaskboardWeb.Admin.ProjectLive.Show do
  use TaskboardWeb, :live_view

  alias Taskboard.Core.Programs
  alias Taskboard.Core.Accounts

  @impl true
  def mount(_params, _session, socket) do
    IO.inspect socket
    # owner = Taskboard.Core.Accounts.get_user()
    #socket = assign(socket, owner: owner)
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    project = Programs.get_project!(id)
    # owner = Accounts.get_user!(project.owner_id)
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:project, project)
     # |> assign(:owner, owner)
    }
  end

  defp page_title(:show), do: "Show Project"
  defp page_title(:edit), do: "Edit Project"
end
