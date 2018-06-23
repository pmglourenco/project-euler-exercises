defmodule Palindrome do
  def palindrome(num_digits) do
    calc_prod(num_digits - 1) 
    |> Enum.max
  end

  def calc_prod(power), do: calc_prod(:math.pow(10, power) |> round, :math.pow(10, power) |> round, power, [])

  defp calc_prod(num1, num2, power, palins) do
    cond do
      num1 >= :math.pow(10, power + 1) ->
        palins
      num2 >= :math.pow(10, power + 1) ->
        calc_prod(num1 + 1, :math.pow(10, power) |> round, power, palins)
      round(num1 * num2)
      |> Integer.digits
      |> is_palindrome? ->
        calc_prod(num1, num2 + 1, power, [num1*num2 | palins])
      true ->
        calc_prod(num1, num2 + 1, power, palins)
    end
  end


  defp is_palindrome?(num_arr) when length(num_arr) <= 1, do: true
  defp is_palindrome?(num_arr) do 
    if List.first(num_arr) == List.last(num_arr) do
      is_palindrome?(List.delete_at(num_arr, 0) |> List.delete_at(-1))
    else
      false
    end
  end
end

ExUnit.start

defmodule PalindromeTest do
  use ExUnit.Case

  test "Biggest palindrome from product of 2 digits numbers is 9009" do
    assert Palindrome.palindrome(2) == 9009
  end

  test "Biggest palindrome from product of 3 digits numbers is 906609" do
    assert Palindrome.palindrome(3) == 906609
  end
end