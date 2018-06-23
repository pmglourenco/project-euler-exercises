defmodule PrimeFactor do
  def primes(num) do
    Enum.max(prime_list(num, []))
  end


  defp prime_list(num, primes), do: prime_list(num, primes, 3)
  defp prime_list(num, primes, index) do
    cond do
      index > num ->
        primes
      prime?(index) && rem(num, index) == 0 ->
        prime_list(div(num, index), [index | primes])
      true ->
        prime_list(num, primes, index+1)
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

defmodule PrimeTest do
  use ExUnit.Case

  test "Biggest prime of 13195 is 29" do
    assert PrimeFactor.primes(13195) == 29
  end

  test "Biggest prime of 600851475143 is 6857" do
    assert PrimeFactor.primes(600851475143) == 6857
  end
end