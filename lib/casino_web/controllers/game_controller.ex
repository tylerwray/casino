defmodule CasinoWeb.GameController do
  @moduledoc false

  use CasinoWeb, :controller
  alias Casino.Game

  def create(conn, _args) do
    code = Game.generate_code()
    json(conn, %{code: code})
  end
end
