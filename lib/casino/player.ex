defmodule Casino.Player do
  @moduledoc """
  A context encapsulating a casino player.
  """

  def generate_uuid do
    Ecto.UUID.generate()
  end
end
