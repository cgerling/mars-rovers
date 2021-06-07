defmodule MarsRoversTest do
  use ExUnit.Case

  describe "deploy/1" do
    test "returns a string with the rover's final position with coordinates and heading direction" do
      deploy_instructions = """
      5 5
      1 2 N
      LMLMLMLMM
      """

      rover_position = "1 3 N"

      assert rover_position == MarsRovers.deploy(deploy_instructions)
    end

    test "returns a multiline string with the final position of each rover in the same order of the instructions" do
      deploy_instructions = """
      5 5
      1 2 N
      LMLMLMLMM
      3 3 E
      MMRMMRMRRM
      """

      rovers_position = "1 3 N\n5 1 E"

      assert rovers_position == MarsRovers.deploy(deploy_instructions)
    end

    test "returns a string with the rover's final position as fallen when the rover walked over the plateau boundaries" do
      deploy_instructions = """
      5 5
      1 2 N
      MMMM
      """

      rover_position = "<fallen>"

      assert rover_position == MarsRovers.deploy(deploy_instructions)
    end

    test "returns a string with the rover's final position as crashed when the rover is in the same position as another rover" do
      deploy_instructions = """
      5 5
      1 2 N
      RMMM
      4 0 E
      LMM
      """

      rover_position = "<crashed>\n<crashed>"

      assert rover_position == MarsRovers.deploy(deploy_instructions)
    end
  end
end
