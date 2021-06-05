defmodule MarsRovers.DirectionTest do
  use ExUnit.Case, async: true

  alias MarsRovers.Direction

  describe "left/0" do
    test "returns left direction" do
      assert :left == Direction.left()
    end
  end

  describe "right/0" do
    test "returns right direction" do
      assert :right == Direction.right()
    end
  end
end
