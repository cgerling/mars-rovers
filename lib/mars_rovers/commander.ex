defmodule MarsRovers.Commander do
  @moduledoc false

  alias MarsRovers.{Command, Direction, Rover}

  @left Command.left()
  @move Command.move()
  @right Command.right()

  def command_rover(%Rover{} = rover, commands) when is_list(commands) do
    Enum.reduce(commands, rover, &execute_command/2)
  end

  defp execute_command(@move, %Rover{} = rover), do: Rover.move(rover)
  defp execute_command(@left, %Rover{} = rover), do: Rover.turn(rover, Direction.left())
  defp execute_command(@right, %Rover{} = rover), do: Rover.turn(rover, Direction.right())
end
