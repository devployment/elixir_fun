defmodule ElixirFunTest do
  use ExUnit.Case
  doctest ElixirFun

  test "greets the world" do
    assert ElixirFun.hello() == :world
  end
end
