defmodule P.Duration do
  @moduledoc false

  use TypeCheck

  defstruct [
    :value,
  ]

  @type! unit :: :days
  @type! larger_than_3 :: number() when larger_than_3 >= 3
    |> TypeCheck.Type.StreamData.wrap_with_gen(&P.Duration.gen/0)

  @type! t() :: %__MODULE__{value: P.Magnitude.t(unit(), larger_than_3())}

  @type! opts :: {:unit, unit()}
  @spec! new(larger_than_3(), [opts()]) :: t()
  def new(amount, unit: unit) do
    struct(__MODULE__, value: P.Magnitude.new(amount, %{unit: unit}))
  end

  def gen() do
    StreamData.one_of([
      StreamData.map(StreamData.positive_integer(), & &1 + 3),
      StreamData.float(min: 3.0)
    ])
  end
end
