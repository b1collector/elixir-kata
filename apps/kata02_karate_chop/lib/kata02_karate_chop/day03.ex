defmodule Kata02KarateChop.Day03 do
  @moduledoc """
  Perform a binary search by first converting the list into a binary search
  and then walking that.
  """

  def chop(target, list) do
    tree = list
             |> Stream.with_index
             |> Enum.to_list
             |> build_binary_tree
    {_, idx} = search_tree(target, tree)
    idx
  end


  defp build_binary_tree([]), do: :leaf
  defp build_binary_tree(list) do
    m_index = length(list) |> div(2)

    { list |> Enum.at(m_index),
      list |> Enum.take(m_index) |> build_binary_tree,
      list |> Enum.drop(m_index + 1) |> build_binary_tree
    }
  end

  defp search_tree(_, :leaf), do: {-1, -1}
  defp search_tree(target, {node = {v, _}, l_tree, r_tree}) do
    cond do
      target >  v -> search_tree(target, r_tree)
      target == v -> node
      target <  v -> search_tree(target, l_tree)
    end
  end

end
