defmodule CasinoWeb.UserSocket do
  use Phoenix.Socket

  alias CasinoWeb.Token

  channel "scrum_poker:*", CasinoWeb.ScrumPokerChannel

  # Check token and assign current user uuid
  @impl true
  def connect(%{"token" => token}, socket, _connect_info) do
    case Token.verify(socket, token) do
      {:ok, current_player} -> {:ok, assign(socket, :current_player, current_player)}
      _ -> :error
    end
  end

  # Make socket assignment anonymous
  @impl true
  def id(_socket), do: nil
end
