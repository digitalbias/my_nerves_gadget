defmodule Leds do
  use Application

  # require Logger
  alias Nerves.Neopixel

  @frame_delay Application.get_env(:leds, :frame_delay, 5)
  @pixel_count Application.get_env(:leds, :pixel_count, 3)
  @gpio_pin Application.get_env(:leds, :gpio_pin, 18)

  def start(_type, _args) do
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
 