# Esperantajxo

Kelkaj aferetoj pri Esperanto.

## Diacritics
Replace text written in h-system or x-system to esperanto diacritics

### Examples
```elixir
iex> alias Esperantajxo.Diakrito.Skribsistemo
iex> Skribsistemo.from_x_system("cx, gx, hx, hX, jx, sx, ux, HX, Hx, jx, JX, jX, Jx")
"ĉ, ĝ, ĥ, ĥ, ĵ, ŝ, ŭ, Ĥ, Ĥ, ĵ, Ĵ, ĵ, Ĵ"
iex> Skribsistemo.from_h_system("ch, gh, hh, hH, jh, sh, uh, HH, Hh, jh, JH, jH, Jh, UH, Uh, uH")
"ĉ, ĝ, ĥ, ĥ, ĵ, ŝ, ŭ, Ĥ, Ĥ, ĵ, Ĵ, ĵ, Ĵ, Ŭ, Ŭ, ŭ"
```
## Nombro
Converts integer numbers to esperanto words

### Examples
```elixir
iex> alias Esperantajxo.Nombro.Numero
iex> Numero.numbers_in_letters(123456789)
"cent dudek tri miliono kvarcent kvindek ses mil sepcent okdek naux"
iex> Numero.numbers_in_letters(9999)
"naux mil nauxcent nauxdek naux"
iex> alias Esperantajxo.Diakrito.Skribsistemo
iex> Numero.numbers_in_letters(9999) |> Skribsistemo.from_x_system()
"naŭ mil naŭcent naŭdek naŭ"
```
