defmodule P.Length do
  @moduledoc false

  use P.Magnitude

  @type! unit_t :: :cm | :in
  @type! amount_t :: (i :: number() when i > 0)
end
