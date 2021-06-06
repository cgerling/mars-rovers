defmodule MarsRovers.CommanderTest do
  use ExUnit.Case, async: true

  alias MarsRovers.{CardinalPoint, Command, Commander, Rover}

  @left Command.left()
  @move Command.move()
  @right Command.right()

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
