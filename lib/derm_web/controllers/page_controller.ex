defmodule DermWeb.PageController do
  use DermWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
