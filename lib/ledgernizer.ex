defmodule Ledgernizer do
  def list_transactions do
    File.read!("lib/statement.csv")
  end
end
