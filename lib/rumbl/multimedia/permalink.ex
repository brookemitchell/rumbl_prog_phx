defmodule Rumbl.Multimedia.Permalink do
  @behaviour Ecto.Type

  def type, do: :id

  def cast(binary) when is_binary(binary) do
    case Integer.parse(binary) do
      {int, _} when int > 0 ->
        {:ok, int}

      _ ->
        :error
    end
  end

  def cast(int) when is_integer(int), do: {:ok, int}
  def cast(_), do: :error

  def dump(int) when is_integer(int), do: {:ok, int}

  def load(int) when is_integer(int), do: {:ok, int}
end
