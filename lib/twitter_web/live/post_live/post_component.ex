defmodule TwitterWeb.PostLive.PostComponent do
  use TwitterWeb, :live_component

  @impl true
  def render(assigns) do
    ~H"""
    <div id={"post-#{@post.id}"} class="p-4 border rounded hover:bg-gray-50 cursor-pointer"
      phx-click={JS.navigate(~p"/posts/#{@post}")}>
      <div class="flex flex-col space-y-2">
        <div class="flex-1">
          <strong>@<%= @post.username %></strong>
        </div>
        <div class="flex-1">
          <%= @post.body %>
        </div>
        <div class="flex justify-between items-center">
          <div class="flex-1">
            <a href="#" phx-click="like" phx-target={@myself}>
              <strong>♡</strong>
              <%= @post.likes_count %>
            </a>
          </div>
          <div class="flex-1">
            <strong>🔁</strong>
            <%= @post.reposts_count %>
          </div>
          <div class="mt-2 flex justify-end space-x-4">
            <.link phx-click={JS.push("delete", value: %{id: @post.id}) |> hide("##{@post.id}")}
              data-confirm="Are you sure for deleting this post?">
              🗑️
            </.link>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
