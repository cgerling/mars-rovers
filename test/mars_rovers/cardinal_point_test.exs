defmodule MarsRovers.CardinalPointTest do
  use ExUnit.Case, async: true

  alias MarsRovers.CardinalPoint

  @east CardinalPoint.east()
  @north CardinalPoint.north()
  @south CardinalPoint.south()
  @west CardinalPoint.west()

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
    test "returns north and south when cardinal point is east" do
      directions = CardinalPoint.get_directions_for(@east)

      assert %{left: @north, right: @south} == directions
    end

    test "returns west and east when cardinal point is north" do
      directions = CardinalPoint.get_directions_for(@north)

      assert %{left: @west, right: @east} == directions
    end

    test "returns east and west when cardinal point is south" do
      directions = CardinalPoint.get_directions_for(@south)

      assert %{left: @east, right: @west} == directions
    end

    test "returns south and north when cardinal point is west" do
      directions = CardinalPoint.get_directions_for(@west)

      assert %{left: @south, right: @north} == directions
    end
  end

  describe "from_string/1" do
    test "returns atom east when the given string is E" do
      assert @east == CardinalPoint.from_string("E")
    end

    test "returns atom north when the given string is N" do
      assert @north == CardinalPoint.from_string("N")
    end

    test "returns atom south when the given string is S" do
      assert @south == CardinalPoint.from_string("S")
    end

    test "returns atom west when the given string is W" do
      assert @west == CardinalPoint.from_string("W")
    end
  end

  describe "to_string/1" do
    test "returns string E when cardinal point is east" do
      assert "E" == CardinalPoint.to_string(@east)
    end

    test "returns string N when cardinal point is north" do
      assert "N" == CardinalPoint.to_string(@north)
    end

    test "returns string S when cardinal point is south" do
      assert "S" == CardinalPoint.to_string(@south)
    end

    test "returns string W when cardinal point is west" do
      assert "W" == CardinalPoint.to_string(@west)
    end
  end
end
