defmodule Agala.Provider.Whatsapp.Conn.ProviderParams do
  defstruct [
    amqp_params: nil,
    bot_name: nil,
    domain: "agala"
  ]

  @type t :: %Agala.Provider.Whatsapp.Conn.ProviderParams{
    amqp_params: Keyword.t(),
    bot_name: atom(),
    domain: atom()
  }

  @behaviour Access
  @doc false
  def fetch(bot_params, key) do
    Map.fetch(bot_params, key)
  end

  @doc false
  def get(structure, key, default \\ nil) do
    Map.get(structure, key, default)
  end

  @doc false
  def get_and_update(term, key, list) do
    Map.get_and_update(term, key, list)
  end

  @doc false
  def pop(term, key) do
    {get(term, key), term}
  end
end
