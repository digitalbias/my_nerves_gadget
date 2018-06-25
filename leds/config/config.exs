use Mix.Config

# Configures the LEDs
config :leds, Leds,
  frame_delay: 5,
  pixel_count: 3,
  gpio_pin: 18
