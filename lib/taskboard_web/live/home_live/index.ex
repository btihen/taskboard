defmodule TaskboardWeb.HomeLive.Index do
  use TaskboardWeb, :live_view

  # alias Taskboard.Landing
  # alias Taskboard.Landing.Home

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
    # {:ok, stream(socket)}
    # {:ok, stream(socket, :homes, Landing.list_homes())}
  end

  @impl true
  @spec handle_params(any(), any(), %{
          :assigns => atom() | %{:live_action => :index, optional(any()) => any()},
          optional(any()) => any()
        }) :: {:noreply, map()}
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  # defp apply_action(socket, :edit, %{"id" => id}) do
  #   socket
  #   |> assign(:page_title, "Edit Home")
  #   |> assign(:home, Landing.get_home!(id))
  # end

  # defp apply_action(socket, :new, _params) do
  #   socket
  #   |> assign(:page_title, "New Home")
  #   |> assign(:home, %Home{})
  # end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Landing Page")
    # |> assign(:home, nil)
  end

  # @impl true
  # def handle_info({TaskboardWeb.HomeLive.FormComponent, {:saved, home}}, socket) do
  #   {:noreply, stream_insert(socket, :homes, home)}
  # end

  # @impl true
  # def handle_event("delete", %{"id" => id}, socket) do
  #   home = Landing.get_home!(id)
  #   {:ok, _} = Landing.delete_home(home)

  #   {:noreply, stream_delete(socket, :homes, home)}
  # end
end
