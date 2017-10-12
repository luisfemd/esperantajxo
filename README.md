# Esperantajxo

Some little stuffs about Esperanto Language. Kelkaj aferetoj pri [Esperanto](http://en.wikipedia.org/wiki/Esperanto)

## Diacritics
Replace text written in h-system or x-system to Esperanto diacritics

### Examples
Run `iex -S mix`
```elixir
iex> alias Esperantajxo.Diakrito.Skribsistemo
iex> Skribsistemo.from_x_system("cx, gx, Gx, hx, hX, jx, sx, ux, HX, Hx, jx, JX, jX, Jx")
"ĉ, ĝ, Ĝ, ĥ, ĥ, ĵ, ŝ, ŭ, Ĥ, Ĥ, ĵ, Ĵ, ĵ, Ĵ"
iex> Skribsistemo.from_h_system("ch, gh, Gh, hh, hH, jh, sh, uh, HH, Hh, jh, JH, jH, Jh, UH, Uh, uH")
"ĉ, ĝ, Ĝ, ĥ, ĥ, ĵ, ŝ, ŭ, Ĥ, Ĥ, ĵ, Ĵ, ĵ, Ĵ, Ŭ, Ŭ, ŭ"
```
## Numbers
Converts integer numbers to Esperanto words

### Examples
Run `iex -S mix`
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
