defmodule HelloGraphqlWeb.PageController do
  use HelloGraphqlWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
