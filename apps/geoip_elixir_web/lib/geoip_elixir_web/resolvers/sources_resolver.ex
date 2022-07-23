defmodule GeoipElixirWeb.SourcesResolver do
  alias GeoipElixir.Sources

  def all_providers(_root, _args, _info) do
    {:ok, Sources.list_providers()}
  end
end
