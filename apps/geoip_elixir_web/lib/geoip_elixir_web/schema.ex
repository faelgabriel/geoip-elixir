defmodule GeoipElixirWeb.Schema do
  use Absinthe.Schema

  alias GeoipElixirWeb.SourcesResolver

  object :provider do
    field :id, non_null(:id)
    field :url, non_null(:string)
    field :description, non_null(:string)
  end

  query do
    @desc "Get all providers"
    field :all_providers, non_null(list_of(non_null(:provider))) do
      resolve(&SourcesResolver.all_providers/3)
    end
  end
end
