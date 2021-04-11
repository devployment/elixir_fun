defmodule ElixirFun.Process do
  def start_and_time(howMany) do
    task =
      Task.async(fn ->
        :timer.tc(__MODULE__, :start, [howMany])
        |> elem(0)
        |> (fn duration -> IO.puts("Took: #{duration / 1_000_000}s") end).()
      end)

    Task.await(task, 10_000)

    # {duration, :ok} = :timer.tc(__MODULE__, :start, [howMany])
    # IO.puts "Execution took: #{duration/1000000} seconds"
  end

  def start(howMany) do
    start_proc(howMany, self())
  end

  def start_proc(0, pid) do
    send(pid, :ok)
  end

  def start_proc(howManyMore, pid) do
    # newPid = spawn_link(__MODULE__, :start_proc, [howManyMore-1, pid])
    # send(newPid, :ok)

    spawn_link(__MODULE__, :start_proc, [howManyMore - 1, pid])
    |> (fn newPid -> send(newPid, :ok) end).()

    receive do
      :ok -> :ok
    end
  end
end
