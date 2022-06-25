defmodule GeoipElixir.Repo do
  use Ecto.Repo,
    otp_app: :geoip_elixir,
    adapter: Ecto.Adapters.Postgres
end
