defmodule Firmware do
  use Application
  require Logger

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    # Define workers and child supervisors to be supervised
    children = [
      supervisor(Phoenix.PubSub.PG2, [Nerves.PubSub, [poolsize: 1]]),
      Leds,
      worker(Task, [fn -> start_network() end], restart: :transient),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Fw.Supervisor]
    Logger.debug("Starting supervisor tree for Firmware children processes")
    Supervisor.start_link(children, opts)
  end

  def start_network do
    Nerves.Network.setup(to_string(@interface))
  end
end
