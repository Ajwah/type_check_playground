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
      |> StreamData.resize(100)
      |> Enum.take(10)
      |> IO.inspect


      # Sample output
      # [
      #   %P.Duration{value: %P.Magnitude{unit: :days, amount: 138}},
      #   %P.Duration{value: %P.Magnitude{unit: :days, amount: -726}},
      #   %P.Duration{value: %P.Magnitude{unit: :days, amount: -739}},
      #   %P.Duration{value: %P.Magnitude{unit: :days, amount: 471}},
      #   %P.Duration{value: %P.Magnitude{unit: :days, amount: 0.04419022263381974}},
      #   %P.Duration{value: %P.Magnitude{unit: :days, amount: 0.30012254605626665}},
      #   %P.Duration{value: %P.Magnitude{unit: :days, amount: -5.396406237314033e299}},
      #   %P.Duration{value: %P.Magnitude{unit: :days, amount: -1.1053539504695976e300}},
      #   %P.Duration{value: %P.Magnitude{unit: :days, amount: 753}},
      #   %P.Duration{value: %P.Magnitude{unit: :days, amount: -7.247619303911501e300}}
      # ]
    end
  end
end
