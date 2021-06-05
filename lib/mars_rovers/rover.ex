defmodule MarsRovers.Rover do
  @moduledoc false

  @enforce_keys [:heading, :x, :y]
  defstruct [:heading, :x, :y]

  alias MarsRovers.CardinalPoint

  @type t :: %__MODULE__{
          heading: CardinalPoint.t(),
          x: integer(),
          y: integer()
        }
end
