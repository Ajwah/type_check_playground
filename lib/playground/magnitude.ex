defmodule P.Magnitude do
  @moduledoc false

  use TypeCheck

  defstruct [
    :unit,
    :amount,
  ]

  @type! unit :: atom()
  @type! amount :: number()

  @type! t(your_unit_type, your_amount_type) :: %__MODULE__{unit: your_unit_type, amount: your_amount_type}

  @spec! new(amount(), %{unit: unit()}) :: t(unit(), amount())
  def new(amount, %{unit: unit}) do
    struct(__MODULE__, amount: amount, unit: unit)
  end
end
