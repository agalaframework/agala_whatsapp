defmodule Agala.Provider.Whatsapp.Helpers do
  # alias Agala.Provider.Whatsapp.Conn.Response

  @spec send_message(conn :: Agala.Conn.t, message :: String.t, opts :: Enum.t) :: Agala.Conn.t
  def send_message(conn, user_id, message, opts \\ []) do
    Map.put(conn, :response, %{
        to: user_id,
        body: message
      }
    )
  end
end
