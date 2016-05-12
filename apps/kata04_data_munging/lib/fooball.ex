defmodule Football do
  @moduledoc """
  Parse and analyze a file containing football scores to find the team wtih the
  smallest spread between goals scored for and against the team.
  """
  @behaviour Parser
  @behaviour SpreadCalculator

  def parse_stream(file) do
    file 
      |> Enum.map(&parse_line/1) 
      |> Enum.filter(fn x -> x != :error end)
  end


  defp parse_line(str) do
    line =str
      |> String.split(" ")
      |> Enum.filter(fn x -> x != "" end)

    with team <- line |> Enum.at(1),
         {goals_for, _} <- line |> Enum.at(6) |> with_default("") |> Integer.parse(),
         {goals_against, _} <- line |> Enum.at(8) |> with_default("") |> Integer.parse() do
      %{team: team, goals_for: goals_for, goals_against: goals_against}
    end
  end

  def calc(%{goals_for: f, goals_against: a}), do: abs(f - a)

  defp with_default(nil, default), do: default
  defp with_default(x, _), do: x

end
