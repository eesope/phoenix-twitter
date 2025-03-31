defmodule Mix.Tasks.Welcome do
  @moduledoc "The twitter mix task: `mix help twitter`"
  use Mix.Task

  def run(name) do
    # mix itself doesn't start app || dependency
    Mix.Task.run("app.start") # start app since using Ecto
    IO.puts("Welcome aboard #{name}!")

    # call Twitter.someFunc()
  end
end
