# GeoipElixir.Umbrella

**IP Geolocation API built with Elixir and GraphQL.**

## Production

Currently, this API is running on production under [Gigalixir](https://www.gigalixir.com/) hosting:

- Application: https://geoip.gigalixirapp.com/
- GraphQL: https://geoip.gigalixirapp.com/graphql

### Deploy to Production

The deployment to production is triggered automatically when a push to the `main` branch occurs.

It uses [Github Actions](https://github.com/faelgabriel/geoip-elixir/actions/workflows/deploy.yml) to trigger the build and deploy it.

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

Inside the container, populate database:

```sh
# navigate to the app where the seeds are
cd apps/geoip_elixir/

# run seeds
mix run priv/repo/seeds.exs
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

GraphQL endpoint and GUI for querying (GraphiQL):

```sh
http://127.0.0.1:4000/graphql
```

To run production environment locally, on the file `config/prod.exs` set to `false` the config `ssl: true`, and inside the container run the following commands:

```sh
export SECRET_KEY_BASE=$(mix phx.gen.secret)
export DATABASE_URL=ecto://postgres:postgres@geoip-elixir-db/geoip_elixir_dev
export APP_HOST=localhost
export PORT=4000
mix deps.get --only prod
MIX_ENV=prod mix compile
MIX_ENV=prod mix phx.server
```

## License

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](LICENSE)
