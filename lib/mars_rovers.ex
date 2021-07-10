defmodule MarsRovers do
  @moduledoc false

  alias MarsRovers.{Commander, Parser, Reporter}

  @spec deploy(String.t()) :: String.t()
  def deploy(deploy_instructions) do
    {plateau, squad_with_commands} = Parser.parse_deploy_instructions(deploy_instructions)

    squad_with_commands
    |> Commander.command_squad()
    |> Reporter.report_squad_status(plateau)
  end
end
