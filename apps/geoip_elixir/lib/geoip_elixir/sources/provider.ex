defmodule GeoipElixir.Sources.Provider do
  use Ecto.Schema
  import Ecto.Changeset

  schema "providers" do
    field :description, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(provider, attrs) do
    provider
    |> cast(attrs, [:url, :description])
    |> validate_required([:url, :description])
  end
end
