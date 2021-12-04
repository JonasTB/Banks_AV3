defmodule Av3FinalWeb.SessionController do
  use Av3FinalWeb, :controller

  alias Av3Final.Users

  def login(conn, %{"user" => user}) do
    case Users.get_by_email_password(user["email"], user["password"]) do
      nil ->
        conn
        |> put_status(:unauthorized)
        |> json(%{message: "Invalid credentials"})

      user ->
        token = Phoenix.token.sign(BanksAv3.Endpoint, "login_user_token", user)

        conn
        |> put_status(:created)
        |> json(%{email: user.email, token: token})
    end
  end
end
