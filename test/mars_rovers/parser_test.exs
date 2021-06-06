defmodule MarsRovers.ParserTest do
  use ExUnit.Case, async: true

  alias MarsRovers.{CardinalPoint, Command, Parser, Plateau}

  @left Command.left()
  @move Command.move()
  @right Command.right()

  describe "parse_mission_information/1" do
    test "returns a tuple with a plateau and a list of rovers with commands" do
      deploy_instructions = """
      5 5
      1 2 N
      LMLMLMLMMR
      """

      {%Plateau{} = plateau, squad} = Parser.parse_deploy_instructions(deploy_instructions)

      assert plateau.height == 5
      assert plateau.width == 5
      assert Enum.count(squad) == 1

      [{rover, commands}] = squad
      assert rover.heading == CardinalPoint.north()
      assert rover.x == 1
      assert rover.y == 2

      assert commands == [@left, @move, @left, @move, @left, @move, @left, @move, @move, @right]
    end
  end
end
