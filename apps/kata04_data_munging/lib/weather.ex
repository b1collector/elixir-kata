defmodule Weather do
  @moduledoc """
  Parse a data file to find the new with the smallest temperature spread.
  """

  @doc """
  Find the day with the smallest temperature spread from a file.
  """
  def program (path) do
    path
      |> File.read!()
      |> Weather.parse()
      |> Weather.find_smallest_spread()
    
  end

  @doc """
  Given a list of daily temperature data, find the record with the smallest temperature difference.
  """
  def find_smallest_spread(data) do
    default_day = %{day: -1, min_temp: -9999, max_temp: 9999}
    
    data 
      |> Enum.sort_by(&spread/1)
      |> Enum.at(0)
      |> with_default(default_day)
  end

  @doc """
  Calculate the temperature difference for a day record.
  """
  def spread(%{min_temp: mn, max_temp: mx}), do: mx - mn

  @doc """
  Convert a string into a list of daily temperature readings.
  """
  def parse(input) do
    input 
      |> String.split("\n") 
      |> Stream.filter(fn x -> x != "" end) 
      |> Stream.map(&parse_line/1)
      |> Stream.filter(fn x -> x != :skipped_line end)
      |> Enum.to_list()
  end

  ##
  # Private helpers
  ##

  @doc """
  Helper function to convert a nil value to a default value.
  """
  defp with_default(nil, default), do: default 
  defp with_default(a, _), do: a 

  @doc """
  Parse a single line into a daily temperature record.
  """
  defp parse_line(input) do
    input 
      |> String.split(" ") 
      |> Stream.filter(fn x -> x != "" end) 
      |> Enum.take(3)
      |> Enum.map(&Integer.parse/1)
      |> format()
  end

  @doc """
  Format a given value into a daily temperature or :skipped_line
  """
  defp format([{d, _}, {mx, _}, {mn, _}]), do: %{day: d, min_temp: mn, max_temp: mx}
  defp format(_), do: :skipped_line
end
