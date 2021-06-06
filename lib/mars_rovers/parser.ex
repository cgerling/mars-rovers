defmodule MarsRovers.Parser do
  @moduledoc false

  alias MarsRovers.{CardinalPoint, Command, Plateau, Rover}

  @type rover_with_commands :: {Rover.t(), list(Command.t())}

  @spec parse_deploy_instructions(String.t()) :: {Plateau.t(), list(rover_with_commands)}
  def parse_deploy_instructions(instructions) when is_binary(instructions) do
    [plateau_information | squad_information] = String.split(instructions, "\n", trim: true)

    plateau = parse_plateau_information(plateau_information)

    squad =
      squad_information
      |> Enum.map(&parse_squad_information/1)
      |> Enum.chunk_every(2)
      |> Enum.map(&List.to_tuple/1)

    {plateau, squad}
  end

  defp parse_plateau_information(<<height::binary-size(1)>> <> " " <> <<width::binary-size(1)>>) do
    %Plateau{
      height: String.to_integer(height),
      width: String.to_integer(width)
    }
  end

  defp parse_squad_information(
         <<x::binary-size(1)>> <>
           " " <> <<y::binary-size(1)>> <> " " <> <<heading::binary-size(1)>>
       ) do
    %Rover{
      heading: CardinalPoint.from_string(heading),
      x: String.to_integer(x),
      y: String.to_integer(y)
    }
  end

  defp parse_squad_information(commands) when is_binary(commands),
    do: commands |> String.split("", trim: true) |> Enum.map(&Command.from_string/1)
end
