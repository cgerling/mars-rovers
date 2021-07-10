defmodule MarsRovers.RoverTest do
  use ExUnit.Case, async: true

  alias MarsRovers.{CardinalPoint, Plateau, Rover}

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

  describe "to_coordinates/1" do
    test "returns a string with the rover's coordinates and heading direction" do
      rover = %Rover{x: 0, y: 0, heading: @north}

      assert "0 0 N" == Rover.to_coordinates(rover)
    end
  end

  describe "is_outside_of?/2" do
    test "returns true when rover x coordinates is bigger than the plateau dimesions" do
      rover = %Rover{heading: @north, x: 11, y: 1}
      plateau = %Plateau{height: 10, width: 10}

      assert true == Rover.is_outside_of?(rover, plateau)
    end

    test "returns true when rover y coordinates is bigger than the plateau dimesions" do
      rover = %Rover{heading: @north, x: 1, y: 11}
      plateau = %Plateau{height: 10, width: 10}

      assert true == Rover.is_outside_of?(rover, plateau)
    end

    test "returns false when rover coordinates are less than the plateau dimensions" do
      rover = %Rover{heading: @north, x: 5, y: 5}
      plateau = %Plateau{height: 10, width: 10}

      assert false == Rover.is_outside_of?(rover, plateau)
    end

    test "returns false when rover coordinates are equals to the plateau dimensions" do
      rover = %Rover{heading: @north, x: 10, y: 10}
      plateau = %Plateau{height: 10, width: 10}

      assert false == Rover.is_outside_of?(rover, plateau)
    end
  end

  describe "has_crashed_within?/2" do
    test "returns true when rover have duplicated coordinates within the squad" do
      rover = %Rover{heading: :nort, x: 1, y: 1}
      another_rover = %Rover{rover | heading: @east}

      squad = [rover, another_rover]

      assert true == Rover.has_crashed_within?(rover, squad)
    end

    test "returns false when rover have unique coordinates within the squad" do
      rover = %Rover{heading: :nort, x: 1, y: 1}
      another_rover = %Rover{heading: @north, x: 2, y: 0}

      squad = [rover, another_rover]

      assert false == Rover.has_crashed_within?(rover, squad)
    end

    test "returns false when squad have a single rover" do
      rover = %Rover{heading: @north, x: 1, y: 1}

      squad = [rover]

      assert false == Rover.has_crashed_within?(rover, squad)
    end
  end

  describe "fetch_status/3" do
    test "returns online when no problem was detected" do
      rover = %Rover{heading: @north, x: 0, y: 0}
      squad = [rover]
      plateau = %Plateau{height: 5, width: 5}

      assert "online" == Rover.fetch_status(rover, plateau, squad)
    end

    test "returns out of range when rover is out of the plateau boundaries" do
      rover = %Rover{heading: @north, x: 6, y: 0}
      squad = [rover]
      plateau = %Plateau{height: 5, width: 5}

      assert "out of range" == Rover.fetch_status(rover, plateau, squad)
    end

    test "returns crashed when the rover is in the same coordinates of another rover from the squad" do
      rover_a = %Rover{heading: @north, x: 1, y: 3}
      rover_b = %Rover{heading: @south, x: 1, y: 3}
      squad = [rover_a, rover_b]
      plateau = %Plateau{height: 5, width: 5}

      assert "crashed" == Rover.fetch_status(rover_a, plateau, squad)
      assert "crashed" == Rover.fetch_status(rover_b, plateau, squad)
    end
  end
end
