defmodule GeoipElixir.SourcesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GeoipElixir.Sources` context.
  """

  @doc """
  Generate a provider.
  """
  def provider_fixture(attrs \\ %{}) do
    {:ok, provider} =
      attrs
      |> Enum.into(%{
        description: "some description",
        url: "some url"
      })
      |> GeoipElixir.Sources.create_provider()

    provider
  end
end
