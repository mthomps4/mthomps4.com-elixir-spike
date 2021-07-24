defmodule Mthomps4.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Mthomps4.Blog.Tag

  schema "posts" do
    field :file_path, :string
    field :published_on, :utc_datetime
    field :title, :string

    many_to_many :tags, Tag, join_through: "posts_tags"
    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :published_on, :file_path])
    |> cast_assoc(:tags)
    |> validate_required([:title, :published_on, :file_path])
  end
end
