defmodule NervesElixirTrivial do
	
  use Application.Behaviour

  def start(_type, _args) do
    :io.format "Elixir is started - watch the lights blink!\n"
		NervesElixirTrivial.LedTriller.start_link
    NervesElixirTrivial.Supervisor.start_link
  end

  defmodule LedTriller do

		def start_link do
			spawn_link __MODULE__, :trill_leds_forever, []
		end
		
		defp led_path(n) do
			"/sys/class/leds/beaglebone:green:usr#{n}/"
		end

    defp led_write(n, attribute, value) do
			led_path(n) |> Path.join(attribute) |> File.write(value)
		end

    defp led_blink(n, msec) do
			led_write(n, "trigger", "none")
			led_write(n, "brightness", "1")
			:timer.sleep msec
			led_write(n, "brightness", "0")
		end

    def trill_leds_forever do
			Enum.each [0,1,2,3,3,2,1,0], &(led_blink &1, 100)
			trill_leds_forever
		end

  end

end
    