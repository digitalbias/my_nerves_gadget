defmodule Leds.Mixfile do
  use Mix.Project

  def project do
    [
      app: :leds,
      version: "0.0.1",
      elixir: "~> 1.4",
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {Leds, []}, extra_applications: [:logger]]
  end

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:elixir_ale, "~> 1.0"},
      {:nerves_neopixel, "~> 0.3.2"}
    ]
  end
end
