defmodule MarsRovers do
  @moduledoc false

  alias MarsRovers.{Commander, Parser, Rover}

  def deploy(deploy_instructions) do
    {_, rovers_with_commands} = Parser.parse_deploy_instructions(deploy_instructions)

    rovers_with_commands
    |> Enum.map(fn {%Rover{} = rover, commands} -> Commander.command_rover(rover, commands) end)
    |> Enum.map(&Rover.to_string/1)
    |> Enum.join("\n")
  end
end
