defmodule MarsRovers.CardinalPoint do
  @moduledoc false

  alias MarsRovers.Direction

  @type t :: :east | :north | :south | :west

  @left Direction.left()
  @right Direction.right()

  @spec east() :: :east
  def east, do: :east

  @spec north() :: :north
  def north, do: :north

  @spec south() :: :south
  def south, do: :south

  @spec west() :: :west
  def west, do: :west

  @spec get_directions_for(t()) :: %{left: t(), right: t()}
  def get_directions_for(:east), do: %{@left => :north, @right => :south}
  def get_directions_for(:north), do: %{@left => :west, @right => :east}
  def get_directions_for(:south), do: %{@left => :east, @right => :west}
  def get_directions_for(:west), do: %{@left => :south, @right => :north}

  @spec from_string(String.t()) :: t()
  def from_string("E"), do: east()
  def from_string("N"), do: north()
  def from_string("S"), do: south()
  def from_string("W"), do: west()

  @spec to_string(t()) :: String.t()
  def to_string(:east), do: "E"
  def to_string(:north), do: "N"
  def to_string(:south), do: "S"
  def to_string(:west), do: "W"
end
