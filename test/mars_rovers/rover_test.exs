defmodule MarsRovers.RoverTest do
  use ExUnit.Case, async: true

  alias MarsRovers.{CardinalPoint, Rover}

  @east CardinalPoint.east()
  @north CardinalPoint.north()
  @south CardinalPoint.south()
  @west CardinalPoint.west()

  describe "turn/2" do
    test "returns a rover heading to west when rover was faced north and turned to left" do
      rover = %Rover{x: 5, y: 5, heading: @north}

      turned_rover = Rover.turn(rover, :left)

      assert turned_rover.heading == @west
      assert turned_rover.x == rover.x
      assert turned_rover.y == rover.y
    end

    test "returns a rover heading to east when rover was faced north and turned to right" do
      rover = %Rover{x: 5, y: 5, heading: @north}

      turned_rover = Rover.turn(rover, :right)

      assert turned_rover.heading == @east
      assert turned_rover.x == rover.x
      assert turned_rover.y == rover.y
    end

    test "returns a rover heading to north when rover was faced east and turned to left" do
      rover = %Rover{x: 5, y: 5, heading: @east}

      turned_rover = Rover.turn(rover, :left)

      assert turned_rover.heading == @north
      assert turned_rover.x == rover.x
      assert turned_rover.y == rover.y
    end

    test "returns a rover heading to south when rover was faced east and turned to right" do
      rover = %Rover{x: 5, y: 5, heading: @east}

      turned_rover = Rover.turn(rover, :right)

      assert turned_rover.heading == @south
      assert turned_rover.x == rover.x
      assert turned_rover.y == rover.y
    end

    test "returns a rover heading to east when rover was faced south and turned to left" do
      rover = %Rover{x: 5, y: 5, heading: @south}

      turned_rover = Rover.turn(rover, :left)

      assert turned_rover.heading == @east
      assert turned_rover.x == rover.x
      assert turned_rover.y == rover.y
    end

    test "returns a rover heading to west when rover was faced south and turned to right" do
      rover = %Rover{x: 5, y: 5, heading: @south}

      turned_rover = Rover.turn(rover, :right)

      assert turned_rover.heading == @west
      assert turned_rover.x == rover.x
      assert turned_rover.y == rover.y
    end

    test "returns a rover heading to south when rover was faced west and turned to left" do
      rover = %Rover{x: 5, y: 5, heading: @west}

      turned_rover = Rover.turn(rover, :left)

      assert turned_rover.heading == @south
      assert turned_rover.x == rover.x
      assert turned_rover.y == rover.y
    end

    test "returns a rover heading to north when rover was faced west and turned to right" do
      rover = %Rover{x: 5, y: 5, heading: @west}

      turned_rover = Rover.turn(rover, :right)

      assert turned_rover.heading == @north
      assert turned_rover.x == rover.x
      assert turned_rover.y == rover.y
    end
  end

  describe "move/1" do
    test "returns a rover one step forward on x when heading east" do
      rover = %Rover{x: 0, y: 0, heading: @east}

      moved_rover = Rover.move(rover)

      assert moved_rover.heading == rover.heading
      assert moved_rover.x == rover.x + 1
      assert moved_rover.y == rover.y
    end

    test "returns a rover one step forward on y when heading north" do
      rover = %Rover{x: 0, y: 0, heading: @north}

      moved_rover = Rover.move(rover)

      assert moved_rover.heading == rover.heading
      assert moved_rover.x == rover.x
      assert moved_rover.y == rover.y + 1
    end

    test "returns a rover one step backward on y when heading south" do
      rover = %Rover{x: 0, y: 0, heading: @south}

      moved_rover = Rover.move(rover)

      assert moved_rover.heading == rover.heading
      assert moved_rover.x == rover.x
      assert moved_rover.y == rover.y - 1
    end

    test "returns a rover one step backward on x when heading west" do
      rover = %Rover{x: 0, y: 0, heading: @west}

      moved_rover = Rover.move(rover)

      assert moved_rover.heading == rover.heading
      assert moved_rover.x == rover.x - 1
      assert moved_rover.y == rover.y
    end
  end
end
