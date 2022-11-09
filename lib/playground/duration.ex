defmodule P.Duration do
  @moduledoc false

  use TypeCheck
  import TypeCheck.Type.StreamData

  defstruct [
    :value,
  ]

  @type! unit :: :days
  @type! my_numbers :: ((larger_than_3 :: number()) when larger_than_3 >= 3)
                       |> wrap_with_gen(&P.Duration.gen/0)

  @type! t() :: %__MODULE__{value: P.Magnitude.t(unit(), my_numbers())}

  @type! opts :: %{unit: unit()}

  @spec! new(my_numbers(), opts()) :: t()
  def new(amount, %{unit: unit}) do
    struct(__MODULE__, value: P.Magnitude.new(amount, %{unit: unit}))
  end

  def gen() do
    StreamData.one_of([
      StreamData.map(StreamData.positive_integer(), & &1 + 3),
      StreamData.float(min: 3.0)
    ])
  end
end
