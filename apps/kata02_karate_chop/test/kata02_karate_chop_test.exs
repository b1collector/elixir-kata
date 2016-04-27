defmodule Kata02KarateChopTest do
  use ExUnit.Case
  alias Kata02KarateChop.Day01
  doctest Kata02KarateChop

  test "chop day 1 works" do
    assert(-1 == Day01.chop(3, []))
    assert(-1 == Day01.chop(3, [1]))
    assert(0  == Day01.chop(1, [1]))

    assert(0  == Day01.chop(1, [1, 3, 5]))
    assert(1  == Day01.chop(3, [1, 3, 5]))
    assert(2  == Day01.chop(5, [1, 3, 5]))
    assert(-1 == Day01.chop(0, [1, 3, 5]))
    assert(-1 == Day01.chop(2, [1, 3, 5]))
    assert(-1 == Day01.chop(4, [1, 3, 5]))
    assert(-1 == Day01.chop(6, [1, 3, 5]))

    assert(0  == Day01.chop(1, [1, 3, 5, 7]))
    assert(1  == Day01.chop(3, [1, 3, 5, 7]))
    assert(2  == Day01.chop(5, [1, 3, 5, 7]))
    assert(3  == Day01.chop(7, [1, 3, 5, 7]))
    assert(-1 == Day01.chop(0, [1, 3, 5, 7]))
    assert(-1 == Day01.chop(2, [1, 3, 5, 7]))
    assert(-1 == Day01.chop(4, [1, 3, 5, 7]))
    assert(-1 == Day01.chop(6, [1, 3, 5, 7]))
    assert(-1 == Day01.chop(8, [1, 3, 5, 7]))
  end
end
