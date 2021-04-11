defmodule ElixirFun.Chatter do
  def start do
    spawn_link(__MODULE__, :loop, [1])
  end

  def loop(count) do
    receive do
      :done ->
        IO.puts("Closing")
        :ok

      :skip ->
        apply(__MODULE__, :loop, [count + 2])
    after
      2000 ->
        IO.puts("Elixir loop #{count} says: Hello Elixir")
        apply(__MODULE__, :loop, [count + 1])
    end
  end
end
