defmodule Mthomps4.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Mthomps4.Blog.Tag

  schema "posts" do
    field :file_path, :string
    field :published_on, :date
    field :title, :string

    many_to_many :tags, Tag, join_through: "posts_tags"
    timestamps()
  end

  @doc false
  def changeset(post, %{tags: tags} = attrs) do
    post
    |> cast(attrs, [:title, :published_on, :file_path])
    |> validate_required([:title, :published_on, :file_path])
    |> unique_constraint(:title)
    |> put_assoc(:tags, tags)
  end
end
