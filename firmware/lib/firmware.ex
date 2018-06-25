defmodule Firmware do
  use Application

  @interface Application.get_env(:firmware, :interface, :wlan0)

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    # Define workers and child supervisors to be supervised
    children = [
      supervisor(Phoenix.PubSub.PG2, [Nerves.PubSub, [poolsize: 1]]),
      worker(Task, [fn -> start_network() end], restart: :transient)
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Fw.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def start_network do
    Nerves.Network.setup(to_string(@interface))
    start_leds()
  end

  alias Nerves.Neopixel

  @frame_delay Application.get_env(:leds, :frame_delay, 5)
  @pixel_count Application.get_env(:leds, :pixel_count, 3)
  @gpio_pin Application.get_env(:leds, :gpio_pin, 18)

  def start_leds() do
    ch0_config = [pin: @gpio_pin, count: @pixel_count]
    {:ok, pid} = Neopixel.start_link(ch0_config)

    channel = 0
    intensity = 127
    data = [
      {255, 0, 0},
      {0, 255, 0},
      {0, 0, 255},
    ]
    Neopixel.render(channel, {intensity, data})
  end
end
