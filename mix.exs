defmodule NervesElixirTrivial.Mixfile do

  use Mix.Project

  def project do
    [ app: :nerves_elixir_trivial,
      version: "0.0.1",
      elixir: "~> 1.0.0-rc1",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ mod: { NervesElixirTrivial, [] } ]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, git: "https://github.com/elixir-lang/foobar.git", tag: "0.1" }
  #
  # To specify particular versions, regardless of the tag, do:
  # { :barbat, "~> 0.1", github: "elixir-lang/barbat" }
  defp deps do
    [] #[ {:nerves_utils, github: "nerves-project/nerves-utils"} ]
  end
  
end

