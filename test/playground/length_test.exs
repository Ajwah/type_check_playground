defmodule Playground.LengthTest do
  @moduledoc false
  alias P.Length

  use ExUnit.Case, async: true
  doctest Length

  import TypeCheck.ExUnit
  import TypeCheck.Type.StreamData
  require TypeCheck.Type

  spectest(Length)

  describe "Explore StreamData" do
    test "produce" do
      Length.t()
      |> TypeCheck.Type.build()
      |> to_gen()
      |> Enum.take(100)
      |> Enum.each(fn %Length{} = e ->
        assert e.value.unit in [:cm, :in]
        assert is_number(e.value.amount)
      end)
    end
  end
end
