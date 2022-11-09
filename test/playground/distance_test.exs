defmodule Playground.DistanceTest do
  @moduledoc false
  alias P.Distance

  use ExUnit.Case, async: true
  doctest Distance

  import TypeCheck.ExUnit
  import TypeCheck.Type.StreamData
  require TypeCheck.Type

  spectest(Distance)

  describe "Explore StreamData" do
    test "produce" do
      Distance.t()
      |> TypeCheck.Type.build()
      |> to_gen()
      |> StreamData.resize(1000)
      |> Enum.take(100)
      |> Enum.each(fn %Distance{} = e ->
        assert e.value.unit in [:km, :mi]
        assert is_number(e.value.amount)
      end)
    end
  end
end
