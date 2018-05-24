defmodule Agala.Provider.Whatsapp do
  use Agala.Provider
  require Logger

  @moduledoc """
  Module providing adapter for Whatsapp
  """

  def init(bot_params, :receiver) do
    {:ok, conn} = AMQP.Connection.open(bot_params.provider_params.amqp_params)
    {:ok, chan} = AMQP.Channel.open(conn)

    {
      :ok,
      Map.put(bot_params, :private, %{
        channel: chan,
        in_queue:
          queue_name(:in, bot_params.provider_params.bot_name, bot_params.provider_params.domain),
        out_queue:
          queue_name(:out, bot_params.provider_params.bot_name, bot_params.provider_params.domain)
      })
    }
  end

  defp queue_name(direction, bot_name, domain) do
    "#{Atom.to_string(domain)}.#{Atom.to_string(bot_name)}.#{Atom.to_string(direction)}"
  end

  defmacro __using__(:handler) do
    quote location: :keep do
      alias Agala.Provider.Whatsapp.Helpers
    end
  end
end
