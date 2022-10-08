defmodule CasinoWeb.PlayerController do
  @moduledoc false

  use CasinoWeb, :controller
  alias Casino.Player
  alias CasinoWeb.Token

  def create(conn, %{"name" => name}) do
    player_uuid = Player.generate_uuid()
    token = Token.sign(conn, %{id: player_uuid, name: name})
    json(conn, %{id: player_uuid, name: name, token: token})
  end
end
