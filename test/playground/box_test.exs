defmodule Playground.BoxTest do
  @moduledoc false
  alias P.Box

  use ExUnit.Case, async: true
  doctest Box

  import TypeCheck.ExUnit
  import TypeCheck.Type.StreamData
  require TypeCheck.Type

  spectest(Box)

  describe "Explore StreamData" do
    test "produce" do
      Box.t()
      |> TypeCheck.Type.build()
      |> to_gen()
      |> Enum.take(100)
      |> Enum.each(fn %Box{} = e ->
        assert e.height.value.unit in [:cm, :in]
        assert is_number(e.height.value.amount)
      end)
    end
  end
end
