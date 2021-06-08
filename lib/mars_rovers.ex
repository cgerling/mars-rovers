defmodule MarsRovers do
  @moduledoc false

  alias MarsRovers.{Commander, Parser, Plateau, Rover}

  @spec deploy(String.t()) :: String.t()
  def deploy(deploy_instructions) do
    {plateau, squad_with_commands} = Parser.parse_deploy_instructions(deploy_instructions)

    squad = Commander.command_squad(squad_with_commands)

    squad
    |> Enum.map(&get_rover_status(&1, plateau, squad))
    |> Enum.join("\n")
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
