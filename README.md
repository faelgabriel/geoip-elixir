# GeoipElixir.Umbrella

**IP Geolocation built with Elixir and GraphQL.**


## Docker

**This Docker configuration is intended for the development environment only.**

By default, the Docker will expose port 4000 for the Elixir Phoenix app and port 5432 for the Postgres database.

Run the application and database containers:

```sh
docker compose up -d
```

Once done, enter into the application container to have access to the development tools: (Elixir, Hex, etc)

```sh
docker exec -it geoip-elixir-app bash
```

Inside the container, setup the application environment:

```sh
# adjust permissions to be able to edit it outside Docker (e.g. IDE)
chown -Rf 1000:root /app

# gets the application dependencies
mix deps.get

# create database
mix ecto.create
```

Inside the container, start the Elixir Phoenix app server:

```sh
mix phx.server

# or, you can start it interactively
iex -S mix phx.server
```

Verify if it's running by navigating to your server address in your preferred browser:

```sh
127.0.0.1:4000
```

## License

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](LICENSE)
