defmodule UartTest do
  use Application

  # require Logger

  def start(_type, _args) do
    {:ok, pid} = Nerves.UART.start_link
    Nerves.UART.open(pid, "/dev/cu.SLAB_USBtoUART", speed: 115200, active: false)
    Nerves.UART.write(pid, "0\r\n")
  end
end
 