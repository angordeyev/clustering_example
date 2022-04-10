defmodule HelloWorldWeb.HelloController do
  use HelloWorldWeb, :controller

  def world(conn, _params) do
    conn
    |> put_resp_header("content-type", "text/html; charset=utf-8")
    |> Plug.Conn.send_file(200, "world.html")

    #render conn, "world.html"
  end
end