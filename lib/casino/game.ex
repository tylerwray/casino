defmodule Casino.Game do
  @moduledoc """
  A context encapsulating a casino game.
  """

  @code_characters ~w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 0 1 2 3 4 5 6 7 8 9)

  def generate_code do
    @code_characters
    |> Enum.shuffle()
    |> Enum.take(4)
    |> Enum.join()
  end
end
