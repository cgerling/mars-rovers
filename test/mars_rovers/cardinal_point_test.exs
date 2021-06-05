defmodule MarsRovers.CardinalPointTest do
  use ExUnit.Case, async: true

  alias MarsRovers.CardinalPoint

  describe "east/0" do
    test "returns atom east" do
      assert :east == CardinalPoint.east()
    end
  end

  describe "north/0" do
    test "returns atom north" do
      assert :north == CardinalPoint.north()
    end
  end

  describe "south/0" do
    test "returns atom south" do
      assert :south == CardinalPoint.south()
    end
  end

  describe "west/0" do
    test "returns atom west" do
      assert :west == CardinalPoint.west()
    end
  end
end
