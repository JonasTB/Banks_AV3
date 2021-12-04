defmodule Av3Final.Transactions do
  @moduledoc """
  The Transactions context.
  """

  import Ecto.Query, warn: false
  alias Av3Final.Repo

  alias Av3Final.Transactions.Banks

  @doc """
  Returns the list of banks.

  ## Examples

      iex> list_banks()
      [%Banks{}, ...]

  """
  def list_banks do
    Repo.all(Banks)
  end

  @doc """
  Gets a single banks.

  Raises `Ecto.NoResultsError` if the Banks does not exist.

  ## Examples

      iex> get_banks!(123)
      %Banks{}

      iex> get_banks!(456)
      ** (Ecto.NoResultsError)

  """
  def get_banks!(id), do: Repo.get!(Banks, id)

  @doc """
  Creates a banks.

  ## Examples

      iex> create_banks(%{field: value})
      {:ok, %Banks{}}

      iex> create_banks(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_banks(attrs \\ %{}) do
    %Banks{}
    |> Banks.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a banks.

  ## Examples

      iex> update_banks(banks, %{field: new_value})
      {:ok, %Banks{}}

      iex> update_banks(banks, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_banks(%Banks{} = banks, attrs) do
    banks
    |> Banks.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a banks.

  ## Examples

      iex> delete_banks(banks)
      {:ok, %Banks{}}

      iex> delete_banks(banks)
      {:error, %Ecto.Changeset{}}

  """
  def delete_banks(%Banks{} = banks) do
    Repo.delete(banks)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking banks changes.

  ## Examples

      iex> change_banks(banks)
      %Ecto.Changeset{data: %Banks{}}

  """
  def change_banks(%Banks{} = banks, attrs \\ %{}) do
    Banks.changeset(banks, attrs)
  end
end
