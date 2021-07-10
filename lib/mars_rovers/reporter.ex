defmodule MarsRovers.Reporter do
  @moduledoc false

  alias MarsRovers.{Plateau, Rover}

  @spec report_rover_status(Rover.t(), Plateau.t(), list(Rover.t())) :: String.t()
  def report_rover_status(%Rover{} = rover, %Plateau{} = plateau, squad)
      when is_list(squad) do
    status = Rover.fetch_status(rover, plateau, squad)

    "#{Rover.to_coordinates(rover)} (#{status})"
  end

  @spec report_squad_status(list(Rover.t()), Plateau.t()) :: String.t()
  def report_squad_status(squad, %Plateau{} = plateau) when is_list(squad) do
    squad
    |> Enum.map(&report_rover_status(&1, plateau, squad))
    |> Enum.join("\n")
  end
end
