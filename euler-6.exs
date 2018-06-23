defmodule SumSquareDifference do
  def difference(num) do
    square_of_sum(num) - sum_of_squares(num)
    # sum_of_squares(num)
  end

  defp sum_of_squares(num) do
    Enum.map(1..num, fn x -> :math.pow(x, 2) |> round end)
    |> Enum.reduce(0, fn(x, acc) -> x + acc end)
  end

  defp square_of_sum(num) do
    Enum.reduce(1..num, 0, fn(x, acc) -> x + acc end)
    |> :math.pow(2)
    |> round
  end
end

ExUnit.start

defmodule SumSquareDiffTest do
  use ExUnit.Case

  test "Sum Square Difference for the first 10 numbers is 2640" do
    assert SumSquareDifference.difference(10) == 2640
  end

  test "Sum Square Difference for the first 100 numbers is 25164150" do
    assert SumSquareDifference.difference(100) == 25164150
  end
end