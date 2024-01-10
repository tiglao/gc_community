defmodule GcCommunityWeb.HomeLive do
  use GcCommunityWeb, :live_view

  alias GcCommunity.Posts.Post

  @impl true
  def render(assigns) do
    ~H"""
    <h1 class="text-2x1">Ghostcart</h1>

    <.button type="button" phx-click={show_modal("new-post-modal")}>Create Post</.button>

    <.modal id="new-post-modal">
      <.simple_form for={@form} phx-change="validate" phx-submit="save-post">
        <.live_file_input upload={@uploads.image} required />
        <.input field={@form[:caption]} type="textarea" label="Caption" required />
        <.button type="submit" phx-disable-with="Saving . . .">Create Post</.button>
      </.simple_form>
    </.modal>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    form =
      %Post{}
      |> Post.changeset(%{})
      |> to_form(as: "post")
    socket =
      socket
      |> assign(form: form)
      |> allow_upload(:image, accept: ~w(.png .jpg .jpeg), max_entries: 1)
    {:ok, socket}
  end

  @impl true
  def handle_event("validate", _params, socket) do
    {:noreply, socket}
  end

  def handle_event("save-post", _params, socket) do
    {:noreply, socket}
  end
end
