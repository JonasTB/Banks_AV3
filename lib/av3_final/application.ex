defmodule Av3Final.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Av3Final.Repo,
      # Start the Telemetry supervisor
      Av3FinalWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Av3Final.PubSub},
      # Start the Endpoint (http/https)
      Av3FinalWeb.Endpoint
      # Start a worker by calling: Av3Final.Worker.start_link(arg)
      # {Av3Final.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Av3Final.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Av3FinalWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
