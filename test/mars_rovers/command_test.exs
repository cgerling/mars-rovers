defmodule MarsRovers.CommandTest do
  use ExUnit.Case, async: true

  alias MarsRovers.Command

  describe "move/0" do
    test "returns atom move" do
      assert :move == Command.move()
    end
  end

  describe "left/0" do
    test "returns atom left" do
      assert :left == Command.left()
    end
  end

  describe "right/0" do
    test "returns atom right" do
      assert :right == Command.right()
    end
  end
end
