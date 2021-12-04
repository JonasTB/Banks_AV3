defmodule Av3Final.Repo.Migrations.CreateBanks do
  use Ecto.Migration

  def change do
    create table(:banks) do
      add :revenue, :decimal
      add :outlay, :decimal

      timestamps()
    end

  end
end
