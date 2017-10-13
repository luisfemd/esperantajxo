defmodule Esperantajxo.Nombro.Numero do

  @numeroj  %{
    0 => "nulo",
    1 => "unu",
    2 => "du",
    3 => "tri",
    4 => "kvar",
    5 => "kvin",
    6 => "ses",
    7 => "sep",
    8 => "ok",
    9 => "naux",
    10 => "dek",
    100 => "cent",
    1000 => "mil",
    1000000 => "miliono",
    1000000000 => "miliardo"
  }

  def numbers_in_letters(number) do
    do_numbers_in_letters(number, 0, 0, "")
  end
  def do_numbers_in_letters(0, _, _, _) do
    "nulo"
  end
  def do_numbers_in_letters(number, i, acc, result) when number == acc do
    IO.inspect {number, i, acc, result}
    result
  end
  def do_numbers_in_letters(number, i, acc, result) do
    IO.inspect {number, i, acc, result}
    op = rem(number, pow(10, i + 1)) - acc
    digit = div(op, pow(10, i))
    |> IO.inspect
    result = number_in_letters(digit, i) <> " " <> result
    do_numbers_in_letters(number, i + 1, acc + op, result)
  end
  def number_in_letters(digit, position) when digit == 1 and position > 0 do
    position_in_letters(position)
  end

  def number_in_letters(digit, position) when digit == 0 and rem(position, 3) != 0 do
    ""
  end
  def number_in_letters(digit, position) do
    digit_in_letters(digit) <> position_in_letters(position)
  end
  def digit_in_letters(digit) do
    Map.get(@numeroj, digit)
  end
  def position_in_letters(0) do
    ""
  end
  def position_in_letters(position) when rem(position, 3) == 0 do
    " " <> Map.get(@numeroj, pow(10, position))
  end

  def position_in_letters(position) do
    Map.get(@numeroj, pow(10, position))
  end

  defp pow(a, b) do
    a
    |> :math.pow(b)
    |> round()
  end
end
