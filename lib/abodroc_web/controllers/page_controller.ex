defmodule AbodrocWeb.PageController do
  use AbodrocWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
