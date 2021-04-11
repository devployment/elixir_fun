# ElixirFun

Examples taken from Keith Elder's Erlang talk. Ported them to Elixir get a feeling what Elixir actually is. 

https://www.youtube.com/watch?v=lXiiiLhwBI4

Credits to Keith Elder: https://github.com/keithelder/presentations/tree/master/WhyErlang/demos

## Prerequisites

**Elixir**

https://elixir-lang.org/install.html

Actually works great here using `asdf`

## Usage

###  ElixirFun.Hello

In `iex`: `ElixirFun.Hello.say_it("Your name")`

### ElixirFun.Process

In `iex`: `ElixirFun.Process.start_and_time(1_000_000)`

Spins up `1_000_000` Erlang processes in round about a second. Processes do nothing nancy but processing a messages.

Still impressive isn't it? :scream:

### ElixirFun.Chatter

#### Cluster connection

* Execute each `foo.sh`, `bar.sh` and `baz.sh` in a shell
  * -> This loads the app via `mix`
  * Each Erlang node uses the same cookie
* Execute `Node.list` on `bar@local.test` 
  * -> No other nodes are known
* Execute `Node.ping(:'foo@local.test')` on `bar@local.test`
* Execute `Node.list` on `bar@local.test`
  * -> Now it knows `foo@local.test`
* Execute `Node.list` on `foo@local.test`
  *  -> It knows `bar@local.test`
* Execute `Node.ping(:'foo@local.test')` on `baz@local.test`
* Execute `Node.list` on every node
  * -> All know each other
  
#### Hot reload

* Change the output in `chatter.ex`
* `recompile` on `foo@local.test`
  * Changes are picked up on `foo@local.test`
* Execute `nl(ElixirFun.Chatter)` on `foo@local.test`
  * Changes are picked up on the two other nodes

Magic :unicorn:

