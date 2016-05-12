defmodule Kata04DataMunging do

  def calc_weather_spread(file_path) do
    calc_spread(file_path, Weather)
  end

  def calc_football_spread(file_path) do
    calc_spread(file_path, Football)
  end

  defp calc_spread(file_path, module) do
    file_path
      |> File.stream!
      |> module.parse_stream
      |> Enum.sort_by(&module.calc/1)
      |> Enum.at(0)
  end

end
