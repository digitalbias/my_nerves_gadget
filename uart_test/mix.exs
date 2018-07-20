defmodule UartTest.Mixfile do
  use Mix.Project

  def project do
    [
      app: :uart_test,
      version: "0.0.1",
      elixir: "~> 1.4",
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    # [mod: {UartTest, []}, extra_applications: []]
    []
  end

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:nerves_uart, "~> 1.2"}
    ]
  end
end
