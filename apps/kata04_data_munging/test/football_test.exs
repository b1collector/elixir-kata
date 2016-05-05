defmodule FootballTest do
  use ExUnit.Case

  @doc """
  GIVEN '   1. Arsenal     38    26   9    3   79  -   36    87\n'
   WHEN parsed
   THEN should return %{}
  """
  test "parsing " do
    lines = ["       Team            P     W    L   D    F      A     Pts\n",
             "    1. Arsenal    38    26   9  3    79 -  36    87\n",
             "    2. Liverpool       38    24   8   6    67  -  30    80\n",]
    result = lines |> Football.parse 

    arsenal = result |> Enum.at(0)
    liverpool = result |> Enum.at(1)

    expected0 = %{team: "Arsenal", goals_for: 79, goals_against: 36}
    expected1 = %{team: "Liverpool", goals_for: 67, goals_against: 30}
    assert(arsenal == expected0)
    assert(liverpool == expected1)
  end


  test "program execution" do
    path = Path.join([File.cwd!, "assets", "football.dat"])
    smallest = path |> Football.program()

    assert(smallest.team == "Aston_Villa")
  end

end
