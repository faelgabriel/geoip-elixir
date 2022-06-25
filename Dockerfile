FROM elixir:1.13-otp-25-alpine

# Install tools
RUN apk add --no-cache bash curl git

# Elixir tools and dependencies
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install hex phx_new --force

WORKDIR /app
