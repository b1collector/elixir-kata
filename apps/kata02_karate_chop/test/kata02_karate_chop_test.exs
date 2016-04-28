defmodule Kata02KarateChopTest do
  use ExUnit.Case
  doctest Kata02KarateChop

  test "chop day 1 works" do
    import Kata02KarateChop.Day01, only: [chop: 2]

    assert(-1 == chop(3, []))
    assert(-1 == chop(3, [1]))
    assert(0  == chop(1, [1]))

    assert(0  == chop(1, [1, 3, 5]))
    assert(1  == chop(3, [1, 3, 5]))
    assert(2  == chop(5, [1, 3, 5]))
    assert(-1 == chop(0, [1, 3, 5]))
    assert(-1 == chop(2, [1, 3, 5]))
    assert(-1 == chop(4, [1, 3, 5]))
    assert(-1 == chop(6, [1, 3, 5]))

    assert(0  == chop(1, [1, 3, 5, 7]))
    assert(1  == chop(3, [1, 3, 5, 7]))
    assert(2  == chop(5, [1, 3, 5, 7]))
    assert(3  == chop(7, [1, 3, 5, 7]))
    assert(-1 == chop(0, [1, 3, 5, 7]))
    assert(-1 == chop(2, [1, 3, 5, 7]))
    assert(-1 == chop(4, [1, 3, 5, 7]))
    assert(-1 == chop(6, [1, 3, 5, 7]))
    assert(-1 == chop(8, [1, 3, 5, 7]))
  end

  test "chop day 2 works" do
    import Kata02KarateChop.Day02, only: [chop: 2]

    assert(-1 == chop(3, []))
    assert(-1 == chop(3, [1]))
    assert(0  == chop(1, [1]))

    assert(0  == chop(1, [1, 3, 5]))
    assert(1  == chop(3, [1, 3, 5]))
    assert(2  == chop(5, [1, 3, 5]))
    assert(-1 == chop(0, [1, 3, 5]))
    assert(-1 == chop(2, [1, 3, 5]))
    assert(-1 == chop(4, [1, 3, 5]))
    assert(-1 == chop(6, [1, 3, 5]))

    assert(0  == chop(1, [1, 3, 5, 7]))
    assert(1  == chop(3, [1, 3, 5, 7]))
    assert(2  == chop(5, [1, 3, 5, 7]))
    assert(3  == chop(7, [1, 3, 5, 7]))
    assert(-1 == chop(0, [1, 3, 5, 7]))
    assert(-1 == chop(2, [1, 3, 5, 7]))
    assert(-1 == chop(4, [1, 3, 5, 7]))
    assert(-1 == chop(6, [1, 3, 5, 7]))
    assert(-1 == chop(8, [1, 3, 5, 7]))
  end
end
