defmodule Ledgernizer do
  alias NimbleCSV.RFC4180, as: CSV
  def list_transactions do
    File.read!("lib/statement.csv")
    |> parse
  end

  defp parse(string) do #defp = private function
    CSV.parse_string(string)
  end
end
