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

  describe "from_string/1" do
    @left Command.left()
    @move Command.move()
    @right Command.right()

    test "returns atom left when the given string is L" do
      assert @left == Command.from_string("L")
    end

    test "returns atom move when the given string is M" do
      assert @move == Command.from_string("M")
    end

    test "returns atom right when the given string is R" do
      assert @right == Command.from_string("R")
    end
  end
end
