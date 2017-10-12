defmodule Esperantajxo.Diakrito.Skribsistemo do

  @x_diacritics %{"cx" => ~s(\u{109}), "gx" => ~s(\u{11d}), "hx" => ~s(\u{125}),
    "jx" => ~s(\u{135}), "sx" => ~s(\u{15d}), "ux" => ~s(\u{16d}),
    "cX" => ~s(\u{109}), "gX" => ~s(\u{11d}), "hX" => ~s(\u{125}),
    "jX" => ~s(\u{135}), "sX" => ~s(\u{15d}), "uX" => ~s(\u{16d}),
    "Cx" => ~s(\u{108}), "Gx" => ~s(\u{11c}), "Hx" => ~s(\u{124}),
    "Jx" => ~s(\u{134}), "Sx" => ~s(\u{15c}), "Ux" => ~s(\u{16c}),
    "CX" => ~s(\u{108}), "GX" => ~s(\u{11e}), "HX" => ~s(\u{124}),
    "JX" => ~s(\u{134}), "SX" => ~s(\u{15c}), "UX" => ~s(\u{16c})}

  @h_diacritics %{"ch" => ~s(\u{109}), "gh" => ~s(\u{11d}), "hh" => ~s(\u{125}),
    "jh" => ~s(\u{135}), "sh" => ~s(\u{15d}), "uh" => ~s(\u{16d}),
    "cH" => ~s(\u{109}), "gH" => ~s(\u{11d}), "hH" => ~s(\u{125}),
    "jH" => ~s(\u{135}), "sH" => ~s(\u{15d}), "uH" => ~s(\u{16d}),
    "Ch" => ~s(\u{108}), "Gh" => ~s(\u{11c}), "Hh" => ~s(\u{124}),
    "Jh" => ~s(\u{134}), "Sh" => ~s(\u{15c}), "Uh" => ~s(\u{16c}),
    "CH" => ~s(\u{108}), "GH" => ~s(\u{11e}), "HH" => ~s(\u{124}),
    "JH" => ~s(\u{134}), "SH" => ~s(\u{15c}), "UH" => ~s(\u{16c})}

  @x ~r/cx|gx|hx|jx|sx|ux|Cx|Gx|Hx|Jx|Sx|Ux|CX|GX|HX|JX|SX|UX|cX|gX|hX|jX|sX|uX/
  @h ~r/ch|gh|hh|jh|sh|uh|Ch|Gh|Hh|Jh|Sh|Uh|CH|GH|HH|JH|SH|UH|cH|gH|hH|jH|sH|uH/

  def from_x_system(text) do
    Regex.replace(@x, text, fn(x) -> "#{@x_diacritics[x]}" end)
  end

  def from_h_system(text) do
    Regex.replace(@h, text, fn(x) -> "#{@h_diacritics[x]}" end)
  end
end
