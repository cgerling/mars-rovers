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

  @east CardinalPoint.east()
  @north CardinalPoint.north()
  @south CardinalPoint.south()
  @west CardinalPoint.west()

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

  @spec move(t()) :: t()
  def move(%__MODULE__{heading: @east, x: x} = rover) do
    %{rover | x: x + 1}
  end

  def move(%__MODULE__{heading: @north, y: y} = rover) do
    %{rover | y: y + 1}
  end

  def move(%__MODULE__{heading: @south, y: y} = rover) do
    %{rover | y: y - 1}
  end

  def move(%__MODULE__{heading: @west, x: x} = rover) do
    %{rover | x: x - 1}
  end
end
