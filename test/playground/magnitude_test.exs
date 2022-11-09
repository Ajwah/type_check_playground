defmodule Playground.MagnitudeTest do
  @moduledoc false
  alias P.Magnitude

  use ExUnit.Case, async: true
  doctest Magnitude

  import TypeCheck.ExUnit
  import TypeCheck.Type.StreamData
  require TypeCheck.Type

  spectest Magnitude

  defmodule TypeOverrides do
    use TypeCheck

    @type! unit :: :kg
    @type! amount :: integer()
    @type! t(your_amount_type) :: P.Magnitude.t(unit(), your_amount_type)
  end

  describe "Explore StreamData" do
    test "produce" do
      TypeOverrides.t(TypeOverrides.amount())
      |> TypeCheck.Type.build()
      |> to_gen()
      |> StreamData.resize(1000)
      |> Enum.take(10)
      |> IO.inspect


      # SAMPLE OUTPUT
      # [
      #   %P.Magnitude{unit: :kg, amount: 572},
      #   %P.Magnitude{unit: :kg, amount: -238},
      #   %P.Magnitude{unit: :kg, amount: 662},
      #   %P.Magnitude{unit: :kg, amount: -894},
      #   %P.Magnitude{unit: :kg, amount: -673},
      #   %P.Magnitude{unit: :kg, amount: -332},
      #   %P.Magnitude{unit: :kg, amount: -118},
      #   %P.Magnitude{unit: :kg, amount: 951},
      #   %P.Magnitude{unit: :kg, amount: 717},
      #   %P.Magnitude{unit: :kg, amount: 610}
      # ]
      # .
      # Finished in 0.4 seconds (0.4s async, 0.00s sync)
    end
  end
end
