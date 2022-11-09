defmodule Playground.MagnitudeTest do
  @moduledoc false
  alias P.Magnitude

  use ExUnit.Case, async: true
  doctest Magnitude

  import TypeCheck.ExUnit
  import TypeCheck.Type.StreamData
  require TypeCheck.Type

  spectest(Magnitude)

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
      |> Enum.take(100)
      |> Enum.each(fn %Magnitude{} = e ->
        assert is_integer(e.amount)
      end)
    end
  end
end
