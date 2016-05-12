defmodule WeatherTest do
  use ExUnit.Case

  test "couple lines" do
    str = """
    1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5
    26  97*   64    81          70.4       0.00 H       050  5.1 200  12  4.0 107 45 1014.9
    """

    [ %{day: d1, min_temp: mn1, max_temp: mx1},
      %{day: d2, min_temp: mn2, max_temp: mx2} ] = str |> String.split("\n") |> Weather.parse_stream() |> Enum.to_list()

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
      %{day: d2, min_temp: mn2, max_temp: mx2} ] = str |> String.split("\n") |> Weather.parse_stream() |> Enum.to_list()

    assert(d1 == 1)
    assert(mn1 == 59)
    assert(mx1 == 88)

    assert(d2 == 2)
    assert(mn2 == 63)
    assert(mx2 == 79)
  end

  test "spread calc" do
    day1 = %{day: 6, min_temp: 32, max_temp: 64}
    s = Weather.calc(day1)
    assert(s == 32)

  end

  test "smaller spread for object" do
    spread = Weather.calc(%{})

    assert(spread == 99999)
  end
end
