defmodule Weather do
  @moduledoc """
  Parse a data file to find the new with the smallest temperature spread.
  """
  @behaviour Parser
  @behaviour SpreadCalculator

  def parse_stream(stream) do
    stream
      |> Stream.map(&parse_line/1)
      |> Stream.filter(fn x -> x != :error end)
  end

  def calc(%{min_temp: mn, max_temp: mx}), do: mx - mn
  def calc(_), do: 99999

  defp parse_line(input) do
    input 
      |> String.split(" ") 
      |> Stream.filter(fn x -> x != "" end) 
      |> Stream.take(3)
      |> Enum.map(&Integer.parse/1)
      |> format()
  end

  defp format([{d, _}, {mx, _}, {mn, _}]), do: %{day: d, min_temp: mn, max_temp: mx}
  defp format(_), do: :error
end
