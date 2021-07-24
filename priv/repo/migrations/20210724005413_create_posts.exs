defmodule Mthomps4.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :published_on, :date
      add :file_path, :string

      timestamps()
    end

    unique_index(:posts, [:title])
  end
end
