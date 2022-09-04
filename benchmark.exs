IO.puts("------------")

Benchee.run(
  %{
    "Secuencial" => fn -> Secuencial.read("files") end,
    "Concurrente" => fn -> Concurrente.read("files") end
  },
  memory_time: 2
)
IO.puts("done")
