defmodule CasinoWeb.ScrumPokerChannel do
  use CasinoWeb, :channel
  alias CasinoWeb.Presence

  @impl true
  def join("scrum_poker:" <> _code, _payload, socket) do
    send(self(), :after_join)
    {:ok, socket}
  end

  @impl true
  def handle_in("card.selected", payload, socket) do
    broadcast(socket, "card.selected", payload)
    {:noreply, socket}
  end

  @impl true
  def handle_info(:after_join, socket) do
    if socket.assigns.current_player do
      {:ok, _} =
        Presence.track(socket, socket.assigns.current_player.id, %{
          online_at: inspect(System.system_time(:second)),
          name: socket.assigns.current_player.name
        })
    end

    push(socket, "presence_state", Presence.list(socket))
    {:noreply, socket}
  end
end
