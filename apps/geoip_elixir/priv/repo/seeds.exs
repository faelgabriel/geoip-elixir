# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     GeoipElixir.Repo.insert!(%GeoipElixir.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias GeoipElixir.Sources.Provider
alias GeoipElixir.Repo

%Provider{url: "https://dev.maxmind.com/geoip/geolite2-free-geolocation-data", description: "MaxMind Geolite2 Database"} |> Repo.insert!
