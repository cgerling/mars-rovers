defmodule MarsRovers.Plateau do
  @moduledoc false

  @enforce_keys [:height, :width]
  defstruct [:height, :width]

  @type t :: %__MODULE__{
          height: integer(),
          width: integer()
        }
end
