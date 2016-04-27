defmodule Kata02KarateChop.Day01 do
  @moduledoc """
  Solve the binary search problem using the Enum methods.
  """

  def chop(target, list) do
    internal_chop(target, list, 0)
  end

  defp internal_chop(_, [], _) do
    -1
  end

  defp internal_chop(target, [h], idx) do
    if h == target do
      idx
    else
      -1
    end
  end

  defp internal_chop(target, list, idx) do
    -- Had difficulty here with getting the pipes to work correctly. They do
    -- not work the way that I would expect them to work coming from haskell
    -- and elm.
    l = list |> length 
    split_length = div(l, 2)
    {first, sec} = list |> Enum.split(split_length)

    [t] = sec |> Enum.take(1)

    if target < t do
      internal_chop(target, first, idx)
    else
      internal_chop(target, sec, idx + split_length)
    end

  end
end
