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

  describe "get_directions_for/1" do
    @east CardinalPoint.east()
    @north CardinalPoint.north()
    @south CardinalPoint.south()
    @west CardinalPoint.west()

    test "returns north and south when cardinal point is east" do
      assert {@north, @south} == CardinalPoint.get_directions_for(@east)
    end

    test "returns west and east when cardinal point is north" do
      assert {@west, @east} == CardinalPoint.get_directions_for(@north)
    end

    test "returns east and west when cardinal point is south" do
      assert {@east, @west} == CardinalPoint.get_directions_for(@south)
    end

    test "returns south and north when cardinal point is west" do
      assert {@south, @north} == CardinalPoint.get_directions_for(@west)
    end
  end
end
