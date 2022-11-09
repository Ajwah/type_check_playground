defmodule P.Box do
  @moduledoc false

  use TypeCheck

  defstruct [
    :height,
    :width,
    :depth,
    :weight
  ]

  @type! height :: P.Length.t()
  @type! width :: P.Length.t()
  @type! depth :: P.Length.t()
  @type! weight :: P.Weight.t()

  @type! t() :: %__MODULE__{
           height: height(),
           width: width(),
           depth: depth(),
           weight: weight()
         }

  @spec! new(
           P.Length.amount_t(),
           P.Length.amount_t(),
           P.Length.amount_t(),
           P.Weight.amount_t(),
           P.Length.unit_t()
         ) :: t()
  def new(height, width, depth, weight, unit \\ :cm) do
    struct(__MODULE__, %{
      height: P.Length.new(height, %{unit: unit}),
      width: P.Length.new(width, %{unit: unit}),
      depth: P.Length.new(depth, %{unit: unit}),
      weight: P.Weight.new(weight, %{unit: :kg})
    })
  end
end
