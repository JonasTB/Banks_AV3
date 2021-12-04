defmodule Av3Final.Transactions.Banks do
  use Ecto.Schema
  import Ecto.Changeset

  schema "banks" do
    field :outlay, :decimal
    field :revenue, :decimal

    timestamps()
  end

  @doc false
  def changeset(banks, attrs) do
    banks
    |> cast(attrs, [:revenue, :outlay])
    |> validate_required([:revenue, :outlay])
  end
end
