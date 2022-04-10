defmodule TestingWeb.Router do
  use TestingWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TestingWeb do
    pipe_through :api
  end
end
