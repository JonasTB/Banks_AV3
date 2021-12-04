defmodule Av3FinalWeb.BanksControllerTest do
  use Av3FinalWeb.ConnCase

  alias Av3Final.Transactions

  @create_attrs %{outlay: "120.5", revenue: "120.5"}
  @update_attrs %{outlay: "456.7", revenue: "456.7"}
  @invalid_attrs %{outlay: nil, revenue: nil}

  def fixture(:banks) do
    {:ok, banks} = Transactions.create_banks(@create_attrs)
    banks
  end

  describe "index" do
    test "lists all banks", %{conn: conn} do
      conn = get(conn, Routes.banks_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Banks"
    end
  end

  describe "new banks" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.banks_path(conn, :new))
      assert html_response(conn, 200) =~ "New Banks"
    end
  end

  describe "create banks" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.banks_path(conn, :create), banks: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.banks_path(conn, :show, id)

      conn = get(conn, Routes.banks_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Banks"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.banks_path(conn, :create), banks: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Banks"
    end
  end

  describe "edit banks" do
    setup [:create_banks]

    test "renders form for editing chosen banks", %{conn: conn, banks: banks} do
      conn = get(conn, Routes.banks_path(conn, :edit, banks))
      assert html_response(conn, 200) =~ "Edit Banks"
    end
  end

  describe "update banks" do
    setup [:create_banks]

    test "redirects when data is valid", %{conn: conn, banks: banks} do
      conn = put(conn, Routes.banks_path(conn, :update, banks), banks: @update_attrs)
      assert redirected_to(conn) == Routes.banks_path(conn, :show, banks)

      conn = get(conn, Routes.banks_path(conn, :show, banks))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, banks: banks} do
      conn = put(conn, Routes.banks_path(conn, :update, banks), banks: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Banks"
    end
  end

  describe "delete banks" do
    setup [:create_banks]

    test "deletes chosen banks", %{conn: conn, banks: banks} do
      conn = delete(conn, Routes.banks_path(conn, :delete, banks))
      assert redirected_to(conn) == Routes.banks_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.banks_path(conn, :show, banks))
      end
    end
  end

  defp create_banks(_) do
    banks = fixture(:banks)
    %{banks: banks}
  end
end
