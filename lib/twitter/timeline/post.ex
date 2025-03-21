defmodule Twitter.Timeline.Post do
# db schema

  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string
    field :username, :string, default: "h_simpson"
    field :likes_count, :integer, default: 0
    field :reposts_count, :integer, default: 0

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do # what to track on db
    post
    |> cast(attrs, [:body])
    |> validate_required([:body])
    |> validate_length(:body, min: 2, max: 180)
  end
end
