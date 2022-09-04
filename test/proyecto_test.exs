defmodule ProyectoTest do
  use ExUnit.Case
  doctest Proyecto

  test "greets the world" do
    assert Proyecto.hello() == :world
  end
end
