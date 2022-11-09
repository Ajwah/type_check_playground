defmodule P.Duration do
  @moduledoc false

  use P.Magnitude

  @type! unit_t :: :days
  @type! amount_t ::
           (larger_than_3 :: number() when larger_than_3 >= 3)
           |> wrap_with_gen(&P.Duration.gen/0)

  def gen() do
    StreamData.one_of([
      StreamData.map(StreamData.positive_integer(), &(&1 + 3)),
      StreamData.float(min: 3.0)
    ])
  end
end
