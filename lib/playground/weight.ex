defmodule P.Weight do
  @moduledoc false

  use P.Magnitude

  @type! unit_t :: :kg | :lb
  @type! amount_t :: (i :: number() when i > 0)
end
