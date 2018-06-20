defmodule Agala.Provider.Whatsapp.Helpers do
  alias Agala.Provider.Whatsapp.Conn.Response

  @spec send_message(conn :: Agala.Conn.t, message :: String.t, opts :: Enum.t) :: Agala.Conn.t
  def send_message(conn, chat_id, message, opts \\ []) do
    Map.put(conn, :response, %Response{
      event: "send_message",
      payload: %{
        chat_id: chat_id,
        message: message
      },
      opts: opts
    })
  end
end
