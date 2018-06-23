defmodule SmallMultiple do
  def small_multiple(max) do
    get_smallest_multiple(max)
  end

  defp get_smallest_multiple(2), do: least_common_multiple(2, 1)
  defp get_smallest_multiple(number) do
    least_common_multiple(number, get_smallest_multiple(number - 1))
  end

  defp least_common_multiple(a, b) do
    (a * b) / greatest_common_divisor(a, b)
    |> round
  end

  defp greatest_common_divisor(a, b) when a == b, do: a
  defp greatest_common_divisor(a, b) when a > b, do: greatest_common_divisor(a - b, b)
  defp greatest_common_divisor(a, b) when a < b, do: greatest_common_divisor(a, b - a)
end

ExUnit.start

defmodule SmallMultipleTest do
  use ExUnit.Case

  test "Smallest evenly divisible number from 1 to 10 is 2520" do
    assert SmallMultiple.small_multiple(10) == 2520
  end

  test "Smallest evenly divisible number from 1 to 20 is 2520" do
    assert SmallMultiple.small_multiple(20) == 232792560
  end
end