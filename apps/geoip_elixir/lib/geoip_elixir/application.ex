defmodule GeoipElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      GeoipElixir.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: GeoipElixir.PubSub}
      # Start a worker by calling: GeoipElixir.Worker.start_link(arg)
      # {GeoipElixir.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: GeoipElixir.Supervisor)
  end
end
