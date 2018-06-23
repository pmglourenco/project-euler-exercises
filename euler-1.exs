defmodule MathEx do
  def sum(num) do
    Enum.sum( for n <- 0..num-1, div_3_or_5?(n), do: n )
    # for n <- 0..num-1, div_3_or_5?(n), do: IO.puts(n)
  end

  defp div_3_or_5?(num) do
    rem(num, 3) == 0 || rem(num, 5) == 0
  end
end

{val, _} =
IO.gets("number to sum: ")
|> Integer.parse

MathEx.sum(val)
|> IO.puts
