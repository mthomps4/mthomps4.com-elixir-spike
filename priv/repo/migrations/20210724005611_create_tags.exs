defmodule Mthomps4.Repo.Migrations.CreateTags do
  use Ecto.Migration

  def change do
    create table(:tags) do
      add :name, :string

      timestamps()
    end

    unique_index(:tags, [:name])
  end
end
