defmodule Weather do
  @moduledoc """
  Parse a data file to find the new with the smallest temperature spread.
  """

  def find_smallest_spread(data) do
    default_day = %{day: -1, min_temp: -9999, max_temp: 9999}
    data |> Enum.map_reduce(default_day, &spread_compare/2)
  end

  def spread_compare(d1, d2) do
    if spread(d1) < spread(d2) do
      d1
    else
      d2
    end
  end

  def spread(%{min_temp: mn, max_temp: mx}) do
    mx - mn
  end

  def parse(input) do
    input 
      |> String.split("\n") 
      |> Stream.filter(fn x -> x != "" end) 
      |> Stream.map(&parse_line/1)
      |> Stream.filter(fn x -> x != :skipped_line end)
      |> Enum.to_list()
  end

  def parse_line(input) do
    input 
      |> String.split(" ") 
      |> Stream.filter(fn x -> x != "" end) 
      |> Enum.take(3)
      |> Enum.map(&Integer.parse/1)
      |> format

  end

  defp format([a, b, c]) when a == :error or b == :error or c == :error do
    :skipped_line
  end

  defp format([{d, _}, {mx, _}, {mn, _}]) do
    %{day: d, min_temp: mn, max_temp: mx}
  end
end
