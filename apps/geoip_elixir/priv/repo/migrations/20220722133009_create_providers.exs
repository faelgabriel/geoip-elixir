defmodule GeoipElixir.Repo.Migrations.CreateProviders do
  use Ecto.Migration

  def change do
    create table(:providers) do
      add :url, :string
      add :description, :text

      timestamps()
    end
  end
end
