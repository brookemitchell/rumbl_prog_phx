defmodule Rumbl.Repo do
  # use Ecto.Repo,
  #   otp_app: :rumbl,
  #   adapter: Ecto.Adapters.Postgres

  alias RumblWeb.Models.User

  def all(User) do
    [
      %User{id: "1", name: "Josē", username: "josevalim", password: "elixir"},
      %User{id: "2", name: "Bruce", username: "redrapids", password: "7langs"},
      %User{id: "3", name: "Chris", username: "chrismccord", password: "phx"}
    ]
  end

  def all(_module), do: []

  def get(module, id) do
    Enum.find(all(module), &(&1.id == id))
  end

  def get_by(module, params) do
    Enum.find(all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end)
  end
end
