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
    split_length = list |> length |> div(2)
    {first, sec = [h|_]} = list |> Enum.split(split_length)

    if target < h do
      internal_chop(target, first, idx)
    else
      internal_chop(target, sec, idx + split_length)
    end

  end
end
