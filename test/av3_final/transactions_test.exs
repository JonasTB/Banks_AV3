defmodule Av3Final.TransactionsTest do
  use Av3Final.DataCase

  alias Av3Final.Transactions

  describe "banks" do
    alias Av3Final.Transactions.Banks

    @valid_attrs %{outlay: "120.5", revenue: "120.5"}
    @update_attrs %{outlay: "456.7", revenue: "456.7"}
    @invalid_attrs %{outlay: nil, revenue: nil}

    def banks_fixture(attrs \\ %{}) do
      {:ok, banks} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Transactions.create_banks()

      banks
    end

    test "list_banks/0 returns all banks" do
      banks = banks_fixture()
      assert Transactions.list_banks() == [banks]
    end

    test "get_banks!/1 returns the banks with given id" do
      banks = banks_fixture()
      assert Transactions.get_banks!(banks.id) == banks
    end

    test "create_banks/1 with valid data creates a banks" do
      assert {:ok, %Banks{} = banks} = Transactions.create_banks(@valid_attrs)
      assert banks.outlay == Decimal.new("120.5")
      assert banks.revenue == Decimal.new("120.5")
    end

    test "create_banks/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transactions.create_banks(@invalid_attrs)
    end

    test "update_banks/2 with valid data updates the banks" do
      banks = banks_fixture()
      assert {:ok, %Banks{} = banks} = Transactions.update_banks(banks, @update_attrs)
      assert banks.outlay == Decimal.new("456.7")
      assert banks.revenue == Decimal.new("456.7")
    end

    test "update_banks/2 with invalid data returns error changeset" do
      banks = banks_fixture()
      assert {:error, %Ecto.Changeset{}} = Transactions.update_banks(banks, @invalid_attrs)
      assert banks == Transactions.get_banks!(banks.id)
    end

    test "delete_banks/1 deletes the banks" do
      banks = banks_fixture()
      assert {:ok, %Banks{}} = Transactions.delete_banks(banks)
      assert_raise Ecto.NoResultsError, fn -> Transactions.get_banks!(banks.id) end
    end

    test "change_banks/1 returns a banks changeset" do
      banks = banks_fixture()
      assert %Ecto.Changeset{} = Transactions.change_banks(banks)
    end
  end
end
