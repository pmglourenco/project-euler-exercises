defmodule Primes do
  def prime(n) do
    iter_primes(n) |> List.first
  end

  defp iter_primes(counter), do: iter_primes(counter - 1, 3, [2])
  defp iter_primes(counter, iter, primes) do
    cond do
      counter == 0 ->
        primes
      prime?(iter) ->
        iter_primes(counter - 1, iter + 2, [iter | primes])
      true ->
        iter_primes(counter, iter + 2, primes)
    end
  end

  defp prime?(num), do: prime?(num, 3)
  defp prime?(num, index) do
    cond do
      index > num ->
        false
      index == num ->
        true
      rem(num, 2) == 0 ->
        false
      rem(num, index) == 0 ->
        false
      rem(index, 2) == 0 ->
        prime?(num, index+1)
      rem(num, index) != 0 ->
        prime?(num, index + 1)
    end
  end
end

ExUnit.start

defmodule PrimesTest do
  use ExUnit.Case

  test "The 6th prime is 13" do
    assert Primes.prime(6) == 13
  end

  test "The 10_001st prime is 104743" do
    assert Primes.prime(10_001) == 104_743
  end
end