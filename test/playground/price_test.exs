defmodule Playground.PriceTest do
  @moduledoc false
  alias P.Price

  use ExUnit.Case, async: true
  doctest Price

  import TypeCheck.ExUnit
  import TypeCheck.Type.StreamData
  require TypeCheck.Type

  spectest(Price)

  describe "Explore StreamData" do
    test "produce" do
      Price.t()
      |> TypeCheck.Type.build()
      |> to_gen()
      |> Enum.take(100)
      |> Enum.each(fn %Price{} = e ->
        assert e.value.unit in [:cad, :usd]
        assert is_number(e.value.amount)
      end)
    end
  end
end
