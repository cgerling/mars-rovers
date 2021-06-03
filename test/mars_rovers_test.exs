defmodule MarsRoversTest do
  use ExUnit.Case
  doctest MarsRovers

  test "greets the world" do
    assert MarsRovers.hello() == :world
  end
end
