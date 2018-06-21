defmodule Agala.Provider.Whatsapp.Responser do
  use Agala.Bot.Responser

  @doc """
  Main entry point method. Process the response
  """
  def response(conn, bot_params) do
    AMQP.Basic.publish(bot_params.private.channel, "", bot_params.private.out_queue, :erlang.term_to_binary(conn.response))
  end
end
