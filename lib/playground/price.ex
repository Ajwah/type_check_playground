defmodule P.Price do
  @moduledoc false

  use P.Magnitude

  @type! unit_t :: :usd | :cad
  @type! amount_t :: number()
end
