defmodule GeoipElixir.SourcesTest do
  use GeoipElixir.DataCase

  alias GeoipElixir.Sources

  describe "providers" do
    alias GeoipElixir.Sources.Provider

    import GeoipElixir.SourcesFixtures

    @invalid_attrs %{description: nil, url: nil}

    test "list_providers/0 returns all providers" do
      provider = provider_fixture()
      assert Sources.list_providers() == [provider]
    end

    test "get_provider!/1 returns the provider with given id" do
      provider = provider_fixture()
      assert Sources.get_provider!(provider.id) == provider
    end

    test "create_provider/1 with valid data creates a provider" do
      valid_attrs = %{description: "some description", url: "some url"}

      assert {:ok, %Provider{} = provider} = Sources.create_provider(valid_attrs)
      assert provider.description == "some description"
      assert provider.url == "some url"
    end

    test "create_provider/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sources.create_provider(@invalid_attrs)
    end

    test "update_provider/2 with valid data updates the provider" do
      provider = provider_fixture()
      update_attrs = %{description: "some updated description", url: "some updated url"}

      assert {:ok, %Provider{} = provider} = Sources.update_provider(provider, update_attrs)
      assert provider.description == "some updated description"
      assert provider.url == "some updated url"
    end

    test "update_provider/2 with invalid data returns error changeset" do
      provider = provider_fixture()
      assert {:error, %Ecto.Changeset{}} = Sources.update_provider(provider, @invalid_attrs)
      assert provider == Sources.get_provider!(provider.id)
    end

    test "delete_provider/1 deletes the provider" do
      provider = provider_fixture()
      assert {:ok, %Provider{}} = Sources.delete_provider(provider)
      assert_raise Ecto.NoResultsError, fn -> Sources.get_provider!(provider.id) end
    end

    test "change_provider/1 returns a provider changeset" do
      provider = provider_fixture()
      assert %Ecto.Changeset{} = Sources.change_provider(provider)
    end
  end
end
