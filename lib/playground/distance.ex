defmodule P.Distance do
  @moduledoc false

  use P.Magnitude

  @type! unit_t :: :km | :mi
  @type! amount_t :: non_neg_integer()
end
