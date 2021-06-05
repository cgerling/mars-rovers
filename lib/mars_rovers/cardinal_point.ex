defmodule MarsRovers.CardinalPoint do
  @moduledoc false

  @type east :: :east
  @type north :: :north
  @type south :: :south
  @type west :: :west

  @type t :: east() | north() | south() | west()

  @east :east
  @north :north
  @south :south
  @west :west

  @spec east() :: east()
  def east, do: @east

  @spec north() :: north()
  def north, do: @north

  @spec south() :: south()
  def south, do: @south

  @spec west() :: west()
  def west, do: @west
end
