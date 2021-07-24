defmodule Mthomps4.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Mthomps4.Repo,
      # Start the Telemetry supervisor
      Mthomps4Web.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Mthomps4.PubSub},
      # Start the Endpoint (http/https)
      Mthomps4Web.Endpoint
      # Start a worker by calling: Mthomps4.Worker.start_link(arg)
      # {Mthomps4.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Mthomps4.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Mthomps4Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
