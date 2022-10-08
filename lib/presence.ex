defmodule CasinoWeb.Presence do
  use Phoenix.Presence,
    otp_app: :casino,
    pubsub_server: Casino.PubSub
end
