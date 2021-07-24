defmodule Mthomps4.Blog.Tag do
  use Ecto.Schema
  import Ecto.Query
  import Ecto.Changeset
  alias Mthomps4.Blog.Post

  schema "tags" do
    field :name, :string

    many_to_many :posts, Post, join_through: "posts_tags"
    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end

  def by_name_list(list) when is_list(list) do
    from(t in __MODULE__, where: t.name in ^list)
  end
end
