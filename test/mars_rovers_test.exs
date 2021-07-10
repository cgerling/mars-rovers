defmodule MarsRoversTest do
  use ExUnit.Case

  describe "deploy/1" do
    test "returns a string with the rover's final position with coordinates and heading direction" do
      deploy_instructions = """
      5 5
      1 2 N
      LMLMLMLMM
      """

      squad_status = "1 3 N (online)"

      assert squad_status == MarsRovers.deploy(deploy_instructions)
    end

    test "returns a multiline string with the final position of each rover in the same order of the instructions" do
      deploy_instructions = """
      5 5
      1 2 N
      LMLMLMLMM
      3 3 E
      MMRMMRMRRM
      """

      squad_status = "1 3 N (online)\n5 1 E (online)"

      assert squad_status == MarsRovers.deploy(deploy_instructions)
    end

    test "returns a string with the rover's final position as fallen when the rover walked over the plateau boundaries" do
      deploy_instructions = """
      5 5
      1 2 N
      MMMM
      """

      squad_status = "1 6 N (out of range)"

      assert squad_status == MarsRovers.deploy(deploy_instructions)
    end

    test "returns a string with the rover's final position as crashed when the rover is in the same position as another rover" do
      deploy_instructions = """
      5 5
      1 2 N
      RMMM
      4 0 E
      LMM
      """

      squad_status = "4 2 E (crashed)\n4 2 N (crashed)"

      assert squad_status == MarsRovers.deploy(deploy_instructions)
    end
  end
end
