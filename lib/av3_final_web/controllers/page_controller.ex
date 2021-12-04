defmodule Av3FinalWeb.PageController do
  use Av3FinalWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
