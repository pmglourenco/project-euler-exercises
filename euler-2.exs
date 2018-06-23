defmodule Fibonacci do
  def fib(num) do
    do_fib(0, 1, 0, num)
  end

  defp do_fib(_, b, res, max) when b >= max, do: res

  defp do_fib(a, b, res, max) when b < max do
    sum = a + b
    res = if rem(sum, 2) == 0 do
            res + sum
          else
            res
          end
    do_fib(b, sum, res, max)
  end
end

ExUnit.start

defmodule FibTest do
  use ExUnit.Case

  test "Fibonacci 10 is 44 " do
    assert Fibonacci.fib(40) == 44
  end

  test "Fibonacci 4 mill is 4613732" do
    assert Fibonacci.fib(4_000_000) == 4613732
  end
end