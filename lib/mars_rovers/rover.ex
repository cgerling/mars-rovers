defmodule MarsRovers.Rover do
  @moduledoc false

  @enforce_keys [:heading, :x, :y]
  defstruct [:heading, :x, :y]

  alias MarsRovers.{CardinalPoint, Direction, Plateau}

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

  @spec to_string(t()) :: String.t()
  def to_string(%__MODULE__{heading: heading, x: x, y: y}) do
    "#{x} #{y} #{CardinalPoint.to_string(heading)}"
  end

  @spec is_outside_of?(t(), Plateau.t()) :: bool()
  def is_outside_of?(%__MODULE__{} = rover, %Plateau{} = plateau),
    do: rover.x > plateau.width or rover.y > plateau.height

  @spec has_crashed_within?(t(), list(t())) :: bool()
  def has_crashed_within?(%__MODULE__{x: x, y: y}, squad) when is_list(squad) do
    Enum.count(squad, &(&1.x == x and &1.y == y)) > 1
  end
end
