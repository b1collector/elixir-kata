defmodule Kata04DataMungingTest do
  use ExUnit.Case
  doctest Kata04DataMunging

  test "weather spread" do
    d = Path.join([File.cwd!(), "assets","weather.dat"])
              |> Kata04DataMunging.calc_weather_spread()

    assert(d.day == 14)
    assert(d.min_temp == 59)
    assert(d.max_temp == 61)
  end


  test "football spread" do
    d = Path.join([File.cwd!(), "assets","football.dat"])
              |> Kata04DataMunging.calc_football_spread()
    assert(d.team == "Aston_Villa")
  end
end
