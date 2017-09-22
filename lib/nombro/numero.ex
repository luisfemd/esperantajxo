defmodule Esperantajxo.Nombro.Numero do

  @numeroj  [
  #nulo: 0,
    unu: 1,
    du: 2,
    tri: 3,
    kvar: 4,
    kvin: 5,
    ses: 6,
    sep: 7,
    ok: 8,
    naux: 9,
    dek: 10,
    cent: 100,
    mil: 1000,
    miliono: 1000000,
    miliardo: 1000000000
  ]


  def numbers_in_letters(number) do
    result = case number do
      0 -> [[:nulo]]
      _ -> do_numbers_in_letters(number)
    end
    Enum.map_join(result, " ", fn(list) ->
      Enum.map_join(list, &(to_string(&1)))
    end)
  end

  def do_numbers_in_letters(number, position \\ 0, acc \\ [])

  def do_numbers_in_letters(number, position, acc) when number < 10 do
    [do_number_in_letters(number, position) | acc]
  end

  def do_numbers_in_letters(number, _, _) when number > 999 do
    number
    |> Integer.to_string
    |> thousand_number
    |> Enum.reduce([], fn({n, position}, acc) ->
      number = String.to_integer(n)
      res = case {number, position} do
        {0, _} -> []
        {_, 0} -> do_numbers_in_letters(number)
        {1, _} -> [[position_in_letters(position)]]
         _     -> do_numbers_in_letters(number) ++ [[position_in_letters(position)]]
      end
      acc ++ res
    end)
  end

  def do_numbers_in_letters(number, position, acc) do
    acc = [do_number_in_letters(rem(number, 10), position) | acc]
    do_numbers_in_letters(div(number, 10), position + 1, acc)
  end

  def do_number_in_letters(number, position) when number == 0 and position == 0 do
    []
  end

  def do_number_in_letters(number, position) when position == 0 do
    [digit_in_letters(number)]
  end

  def do_number_in_letters(number, position) when number == 1 and position > 0 do
    [position_in_letters(position)]
  end

  def do_number_in_letters(number, _) when number == 0 do
    []
  end

  def do_number_in_letters(number, position) do
    [digit_in_letters(number), position_in_letters(position)]
  end

  def digit_in_letters(digit) when is_integer(digit) and digit < 10 do
    {k, _} = List.keyfind(@numeroj, digit, 1)
    k
  end

  def position_in_letters(position) when position <= 2 or rem(position, 3) == 0 do
    {k, _} = List.keyfind(@numeroj, :math.pow(10,position), 1)
    k
  end

  def position_in_letters(position) do
    position_in_letters(rem(position, 3))
  end

  def thousand_number(number) when is_binary(number) do
    len = String.length(number)
    rem = rem(len, 3)

    case rem do
      0 ->
        for n <- 0..((div len, 3) - 1) do
          {String.slice(number, 3 * n, 3), len - (3 * (n + 1))}
        end
      _ -> [{String.slice(number, 0, rem), len - rem } | thousand_number(String.slice(number, rem, len))]
    end
  end
end
