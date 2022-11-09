defmodule Playground.DurationTest do
  @moduledoc false
  alias P.Duration

  use ExUnit.Case, async: true
  doctest Duration

  import TypeCheck.ExUnit
  import TypeCheck.Type.StreamData
  require TypeCheck.Type

  spectest Duration

  describe "Explore StreamData" do
    test "produce" do
      Duration.t()
      |> TypeCheck.Type.build()
      |> to_gen()
      |> StreamData.resize(1000)
      |> Enum.take(100)
      |> Enum.each(fn %Duration{} = e ->
        assert e.value.amount >= 3
      end)
    end
  end
end
