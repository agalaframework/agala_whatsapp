defmodule AgalaWhatsappTest do
  use ExUnit.Case
  doctest AgalaWhatsapp

  test "greets the world" do
    assert AgalaWhatsapp.hello() == :world
  end
end
