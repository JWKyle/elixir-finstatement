defmodule Ledgernizer do
  alias NimbleCSV.RFC4180, as: CSV
  def list_transactions do
    File.read!("lib/statement.csv")
    |> parse
    |> filter
    |> normalize
  end

  defp parse(string) do #defp = private function
    CSV.parse_string(string)
  end

  defp filter(rows) do
    Enum.map(rows, &Enum.drop(&1, 1)) #fn(row) -> Enum.drop(row, 1)end
  end

  defp normalize(rows) do
    Enum.map(rows, &parse_amount(&1))
  end

  defp parse_amount([date, transaction, description, amount]) do
    [date, transaction, description, parse_to_float(amount)]
  end

  defp parse_to_float(string) do
    String.to_float(string)
  end
end
