defmodule MarsRovers.Command do
  @moduledoc false

  alias MarsRovers.Direction

  @type left :: Direction.left()
  @type move :: :move
  @type right :: Direction.right()

  @type t :: left() | move() | right()

  @left Direction.left()
  @move :move
  @right Direction.right()

  @spec left() :: left()
  def left, do: @left

  @spec move() :: move()
  def move, do: @move

  @spec right() :: right()
  def right, do: @right

  @spec from_string(String.t()) :: t()
  def from_string("M"), do: @move
  def from_string("L"), do: @left
  def from_string("R"), do: @right
end
