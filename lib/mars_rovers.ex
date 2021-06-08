defmodule MarsRovers do
  @moduledoc false

  alias MarsRovers.{Commander, Parser, Plateau, Rover}

  @spec deploy(String.t()) :: String.t()
  def deploy(deploy_instructions) do
    {plateau, rovers_with_commands} = Parser.parse_deploy_instructions(deploy_instructions)

    squad_final_position = Enum.map(rovers_with_commands, &command_rover/1)

    squad_final_position
    |> Enum.map(&get_rover_status(&1, plateau, squad_final_position))
    |> Enum.join("\n")
  end

  defp command_rover({%Rover{} = rover, commands}) when is_list(commands) do
    Commander.command_rover(rover, commands)
  end

  defp get_rover_status(%Rover{} = rover, %Plateau{} = plateau, squad) when is_list(squad) do
    cond do
      Rover.is_outside_of?(rover, plateau) ->
        "<fallen>"

      Rover.has_crashed_within?(rover, squad) ->
        "<crashed>"

      true ->
        Rover.to_string(rover)
    end
  end
end
