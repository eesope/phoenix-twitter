defmodule Mix.Tasks.GenDummyPosts do
  use Mix.Task
  alias Twitter.Timeline

  @shortdoc "Generates dummy posts for the Twitter project"

  def run(_args) do
    Mix.Task.run("app.start")

    dummy_posts = [
      %{body: "Hello world", username: "lisa"},
      %{body: "Writing Elixir code is fun", username: "bart"},
      %{body: "LiveView rocks!", username: "homer"}
    ]

    Enum.each(dummy_posts, fn attrs -> # add db
      case Timeline.create_post(attrs) do
        {:ok, post} ->
          Mix.shell().info("Created post: #{post.id} - #{post.body}")
        {:error, changeset} ->
          Mix.shell().error("Failed to create post: #{inspect(changeset.errors)}")
      end
    end)
  end
end
