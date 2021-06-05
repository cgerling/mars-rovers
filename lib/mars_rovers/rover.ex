defmodule MarsRovers.Rover do
  @moduledoc false

  @enforce_keys [:heading, :x, :y]
  defstruct [:heading, :x, :y]

  alias MarsRovers.{CardinalPoint, Direction}

  @type t :: %__MODULE__{
          heading: CardinalPoint.t(),
          x: integer(),
          y: integer()
        }

  @left Direction.left()
  @right Direction.right()

  @spec turn(%__MODULE__{}, Direction.t()) :: %__MODULE__{}
  def turn(%__MODULE__{} = rover, direction) do
    direction_ordinal = convert_direction_to_ordinal(direction)

    heading =
      rover.heading
      |> CardinalPoint.get_directions_for()
      |> elem(direction_ordinal)

    %{rover | heading: heading}
  end

  defp convert_direction_to_ordinal(@left), do: 0
  defp convert_direction_to_ordinal(@right), do: 1
end
