defmodule MarsRovers.CommanderTest do
  use ExUnit.Case, async: true

  alias MarsRovers.{CardinalPoint, Command, Commander, Rover}

  @left Command.left()
  @move Command.move()
  @right Command.right()

  describe "command_squad/1" do
    test "returns a list of rovers with their position based on the given commands" do
      rover_a = %Rover{heading: CardinalPoint.north(), x: 2, y: 1}
      rover_a_commands = [@move, @move, @right, @move, @move]
      rover_a_with_commands = {rover_a, rover_a_commands}

      rover_b = %Rover{heading: CardinalPoint.west(), x: 5, y: 2}
      rover_b_commands = [@move, @move, @move, @move, @left]
      rover_b_with_commands = {rover_b, rover_b_commands}

      squad = [rover_a_with_commands, rover_b_with_commands]

      commanded_squad = Commander.command_squad(squad)

      [commanded_rover_a, commanded_rover_b] = commanded_squad
      assert commanded_rover_a.heading == CardinalPoint.east()
      assert commanded_rover_a.x == 4
      assert commanded_rover_a.y == 3

      assert commanded_rover_b.heading == CardinalPoint.south()
      assert commanded_rover_b.x == 1
      assert commanded_rover_b.y == 2
    end
  end

  describe "command_rover/2" do
    test "returns a rover with the position based on the given list of commands" do
      rover = %Rover{heading: CardinalPoint.north(), x: 0, y: 0}
      commands = [@move, @right, @move, @left, @move]

      commanded_rover = Commander.command_rover(rover, commands)

      assert commanded_rover.heading == CardinalPoint.north()
      assert commanded_rover.x == 1
      assert commanded_rover.y == 2
    end
  end
end
