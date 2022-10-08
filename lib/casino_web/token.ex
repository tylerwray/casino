defmodule CasinoWeb.Token do
  @moduledoc """
  A small wrapper utility around generating and verifying web tokens.
  """

  @salt "user auth"

  def sign(conn, body) do
    Phoenix.Token.sign(conn, @salt, body, max_age: :infinity)
  end

  def verify(socket, token) do
    Phoenix.Token.verify(socket, @salt, token, max_age: :infinity)
  end
end
