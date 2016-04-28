defmodule Kata02KarateChop.Day02 do
  @moduledoc """
  Solve the binary search problem without every splitting the array.
  """

  def chop(target, list) do
    internal_chop(target, list, 0, length list)
  end

  defp internal_chop(target, list, l, u) do
    middle = div(u - l, 2) + l
    m_value = Enum.at(list, middle)

    cond do
      m_value == target -> middle
      l == u -> -1
      m_value > target  -> internal_chop(target, list, l, middle)
      m_value < target  -> internal_chop(target, list, middle + 1, u)
    end
    
  end

end
