defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    cond do
      text == "" or shift == 0 -> text
      true -> _rotate(to_charlist(text), shift, "")
    end
  end

  defp _rotate([], _, acc), do: acc
  defp _rotate([h|t], shift, acc) when h >= ?a and h <= ?z, do: _rotate(t, shift, acc <> _rotate_character(h, shift, ?a))
  defp _rotate([h|t], shift, acc) when h >= ?A and h <= ?Z, do: _rotate(t, shift, acc <> _rotate_character(h, shift, ?A))
  defp _rotate([h|t], shift, acc), do: _rotate(t, shift, acc <> <<h>>)

  defp _rotate_character(character, shift, base_character) do
    <<rem((character - base_character + shift) , 26) + base_character>>
  end
end

