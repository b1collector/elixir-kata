defmodule Weather do
  @moduledoc """
  Parse a data file to find the new with the smallest temperature spread.
  """
  def program (path) do
    path
      |> File.read!()
      |> Weather.parse()
      |> Weather.find_smallest_spread()
  end

  def find_smallest_spread(data) do
    default_day = %{day: -1, min_temp: -9999, max_temp: 9999}
    
    data 
      |> Enum.sort_by(&spread/1)
      |> Enum.at(0)
      |> with_default(default_day)

  end

  defp with_default(nil, default), do: default 
  defp with_default(a, _), do: a 

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
      |> format()

  end


  defp format([{d, _}, {mx, _}, {mn, _}]) do
    %{day: d, min_temp: mn, max_temp: mx}
  end

  defp format(_) do
    :skipped_line
  end
end
