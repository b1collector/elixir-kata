defmodule WeatherTest do
  use ExUnit.Case

  test "happy path parse a string into map" do
    str = "   1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5"

    [%{day: d, min_temp: mn, max_temp: mx}] = Weather.parse(str)

    assert(d == 1)
    assert(mn == 59)
    assert(mx == 88)
  end

  test "handle * parse a string into a map" do
    str = "  26  97*   64    81          70.4       0.00 H       050  5.1 200  12  4.0 107 45 1014.9"

    [%{day: d, min_temp: mn, max_temp: mx}] = Weather.parse(str)

    assert(d == 26)
    assert(mn == 64)
    assert(mx == 97)
  end

  test "couple lines" do
    str = """
    1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5
    26  97*   64    81          70.4       0.00 H       050  5.1 200  12  4.0 107 45 1014.9
    """

    [ %{day: d1, min_temp: mn1, max_temp: mx1},
      %{day: d2, min_temp: mn2, max_temp: mx2} ] = Weather.parse(str)

    assert(d1 == 1)
    assert(mn1 == 59)
    assert(mx1 == 88)

    assert(d2 == 26)
    assert(mn2 == 64)
    assert(mx2 == 97)
  end

  test "parse file" do
    str = """
    Dy MxT   MnT   AvT   HDDay  AvDP 1HrP TPcpn WxType PDir AvSp Dir MxS SkyC MxR MnR AvSLP
  
     1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5
     2  79    63    71          46.5       0.00         330  8.7 340  23  3.3  70 28 1004.5
     mo  82.9  60.5  71.7    16  58.8       0.00              6.9          5.3
    """

    [ %{day: d1, min_temp: mn1, max_temp: mx1},
      %{day: d2, min_temp: mn2, max_temp: mx2} ] = Weather.parse(str)

    assert(d1 == 1)
    assert(mn1 == 59)
    assert(mx1 == 88)

    assert(d2 == 2)
    assert(mn2 == 63)
    assert(mx2 == 79)
  end

  test "openning a file and parsing it" do
    d = Path.join([File.cwd!(), "assets","weather.dat"])
          |> File.read!()
          |> Weather.parse()

    day1 = Enum.at(d, 0)
    assert(day1.day == 1)
    assert(day1.min_temp == 59)
    assert(day1.max_temp == 88)

    day2 = Enum.at(d, 1)
    assert(day2.day == 2)
    assert(day2.min_temp == 63)
    assert(day2.max_temp == 79)
  end

  test "spread calc" do
    day1 = %{day: 6, min_temp: 32, max_temp: 64}
    s = Weather.spread(day1)
    assert(s == 32)

  end

  test "spread compare" do
    day1 = %{day: 6, min_temp: 32, max_temp: 64}
    day2 = %{day: 4, min_temp: 54, max_temp: 60}

    smaller = Weather.spread_compare(day1, day2)

    assert(smaller == day2)
  end

  test "smaller spread for empty list" do
    {_, spread} = Weather.find_smallest_spread([])

    IO.inspect(spread)
    assert(spread.day == -1)
  end

  # test "Entire program" do
  #   d = Path.join([File.cwd!(), "assets","weather.dat"])
  #         |> File.read!()
  #         |> Weather.parse()
  #         |> IO.inspect()
  #         |> Weather.find_smallest_spread()

  #   IO.inspect(d)
  #   assert(d.day == 14)
  #   assert(d.min_temp == 59)
  #   assert(d.max_temp == 61)
  # end
end
