defmodule Agala.Provider.Whatsapp.Receiver do
  @moduledoc """
  Main worker module
  """

  use Agala.Bot.Receiver
  alias Agala.BotParams

  def get_updates(notify_with, %BotParams{private: %{in_queue: queue, channel: chan}}) do
    case AMQP.Basic.get(chan, queue, no_ack: true) do
      {:ok, data, _opts} -> notify_with.(:erlang.binary_to_term(data))
      {:empty, _opts} -> :do_nothing
      error -> Logger.error("Error while receiving updates for Whatsapp from RabbitMQ: #{error}")
    end
  end
end
