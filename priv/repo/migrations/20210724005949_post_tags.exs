defmodule Mthomps4.Repo.Migrations.PostTags do
  use Ecto.Migration

  def change do
    create table(:posts_tags, primary_key: false) do
      add :tag_id, references(:tags)
      add :post_id, references(:posts)
    end

    create unique_index(:posts_tags, [:tag_id, :post_id])
  end
end
