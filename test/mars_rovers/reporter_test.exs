defmodule MarsRovers.ReporterTest do
  use ExUnit.Case, async: true

  alias MarsRovers.{CardinalPoint, Plateau, Reporter, Rover}

  describe "report_rover_status/3" do
    test "returns a string with the rovers coordinates and status" do
      rover = %Rover{x: 0, y: 0, heading: CardinalPoint.north()}
      plateau = %Plateau{height: 10, width: 10}
      squad = [rover]

      assert "0 0 N (online)" == Reporter.report_rover_status(rover, plateau, squad)
    end

    test "returns a string with the rovers coordinates and status as out of range when rover's coordinates are bigger then plateau dimenstions" do
      rover = %Rover{x: 11, y: 11, heading: CardinalPoint.south()}
      plateau = %Plateau{height: 10, width: 10}
      squad = [rover]

      assert "11 11 S (out of range)" == Reporter.report_rover_status(rover, plateau, squad)
    end

    test "returns a string with the rovers coordinates and status as crashed when coordinates are equal to another rover in the squad" do
      plateau = %Plateau{height: 10, width: 10}
      rover = %Rover{x: 0, y: 0, heading: CardinalPoint.north()}

      same_coordinates_rover = %Rover{x: 0, y: 0, heading: CardinalPoint.east()}
      squad = [rover, same_coordinates_rover]

      assert "0 0 N (crashed)" == Reporter.report_rover_status(rover, plateau, squad)
    end
  end

  describe "report_squad_status/2" do
    test "returns a multiline string with coordinates and status of each rover in the squad" do
      rover_online = %Rover{x: 0, y: 0, heading: CardinalPoint.west()}
      rover_out_of_range = %Rover{x: 6, y: 6, heading: CardinalPoint.east()}
      rover_crashed = %Rover{x: 0, y: 0, heading: CardinalPoint.north()}
      plateau = %Plateau{height: 5, width: 5}
      squad = [rover_online, rover_out_of_range, rover_crashed]

      squad_status = "0 0 W (crashed)\n6 6 E (out of range)\n0 0 N (crashed)"
      assert squad_status == Reporter.report_squad_status(squad, plateau)
    end
  end
end
