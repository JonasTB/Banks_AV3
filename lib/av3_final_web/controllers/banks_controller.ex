defmodule Av3FinalWeb.BanksController do
  use Av3FinalWeb, :controller

  alias Av3Final.Transactions
  alias Av3Final.Transactions.Banks

  def index(conn, _params) do
    banks = Transactions.list_banks()
    render(conn, "index.html", banks: banks)
  end

  def new(conn, _params) do
    changeset = Transactions.change_banks(%Banks{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"banks" => banks_params}) do
    case Transactions.create_banks(banks_params) do
      {:ok, banks} ->
        conn
        |> put_flash(:info, "Banks created successfully.")
        |> redirect(to: Routes.banks_path(conn, :show, banks))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    banks = Transactions.get_banks!(id)
    render(conn, "show.html", banks: banks)
  end

  def edit(conn, %{"id" => id}) do
    banks = Transactions.get_banks!(id)
    changeset = Transactions.change_banks(banks)
    render(conn, "edit.html", banks: banks, changeset: changeset)
  end

  def update(conn, %{"id" => id, "banks" => banks_params}) do
    banks = Transactions.get_banks!(id)

    case Transactions.update_banks(banks, banks_params) do
      {:ok, banks} ->
        conn
        |> put_flash(:info, "Banks updated successfully.")
        |> redirect(to: Routes.banks_path(conn, :show, banks))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", banks: banks, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    banks = Transactions.get_banks!(id)
    {:ok, _banks} = Transactions.delete_banks(banks)

    conn
    |> put_flash(:info, "Banks deleted successfully.")
    |> redirect(to: Routes.banks_path(conn, :index))
  end
end
