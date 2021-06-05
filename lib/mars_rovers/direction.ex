defmodule MarsRovers.Direction do
  @moduledoc false

  @type left :: :left
  @type right :: :right

  @type t :: :left | :right

  @spec left() :: left()
  def left, do: :left

  @spec right() :: right()
  def right, do: :right
end
