

defmodule Mix.Tasks.ListTransactions do
  use Mix.Task # This uses functions from other modules

  def run(_) do #underscore tells compiler to ignore number arguments warning
    Ledgernizer.list_transactions |> IO.inspect #inspect gives more info than puts
  end
end
