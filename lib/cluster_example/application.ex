defmodule ClusterExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    topologies = 
      [
        example: [
          strategy: Cluster.Strategy.Epmd,
          config: [hosts: [:"a@164.92.242.104", :"b@167.99.252.129"]],
        ]
      ]

    children = [
      {Cluster.Supervisor, [topologies, [name: ClusterExample.ClusterSupervisor]]},
      # Start the Ecto repository
      ClusterExample.Repo,
      # Start the Telemetry supervisor
      ClusterExampleWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ClusterExample.PubSub},
      # Start the Endpoint (http/https)
      ClusterExampleWeb.Endpoint
      # Start a worker by calling: ClusterExample.Worker.start_link(arg)
      # {ClusterExample.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ClusterExample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ClusterExampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
