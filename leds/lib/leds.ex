defmodule Leds do
  use GenServer
  require Logger

  alias ElixirALE.GPIO

  @output_pin 18
  @blink_durration 500
  @gpio_on 1
  @gpio_off 0

  def init(args) do
    {:ok, args}
  end

  def start(_type, _args) do
    begin_blinking()
  end

  def start_link(_) do
    begin_blinking()
  end

  def begin_blinking() do
    Logger.info("Starting pin #{@output_pin} as output")
    {:ok, output_pid} = GPIO.start_link(@output_pin, :output)
    pid = spawn(fn -> toggle_pin_forever(output_pid) end)
    {:ok, pid}
  end

  defp toggle_pin_forever(output_pid) do
    Logger.debug("Turning pin #{@output_pin} ON")
    GPIO.write(output_pid, @gpio_on)
    # Process.sleep(@blink_durration)
    :timer.sleep @blink_durration

    Logger.debug("Turning pin #{@output_pin} OFF")
    GPIO.write(output_pid, @gpio_off)
    # Process.sleep(@blink_durration)
    :timer.sleep @blink_durration

    toggle_pin_forever(output_pid)
  end
end
