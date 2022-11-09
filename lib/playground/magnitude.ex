defmodule P.Magnitude do
  @moduledoc false

  use TypeCheck

  defstruct [
    :unit,
    :amount
  ]

  @type! unit :: atom()
  @type! amount :: number()

  @type! t(your_unit_type, your_amount_type) :: %__MODULE__{
           unit: your_unit_type,
           amount: your_amount_type
         }

  @spec! new(amount(), %{unit: unit()}) :: t(unit(), amount())
  def new(amount, %{unit: unit}) do
    struct(__MODULE__, amount: amount, unit: unit)
  end

  defmacro __using__(_) do
    quote location: :keep do
      use TypeCheck
      import TypeCheck.Type.StreamData

      defstruct [
        :value
      ]

      @type! t() :: %__MODULE__{value: P.Magnitude.t(unit_t(), amount_t())}

      @type! opts :: %{unit: unit_t()}

      @spec! new(amount_t(), opts()) :: t()
      def new(amount, %{unit: unit}) do
        struct(__MODULE__, value: P.Magnitude.new(amount, %{unit: unit}))
      end
    end
  end
end
