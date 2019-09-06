defmodule DemoWeb.Router do
  use DemoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :veryfy_user_token
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DemoWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", DemoWeb do
    pipe_through :api

    # resources "/", AuthController
    resources "/auth", UserController
  end

  defp veryfy_user_token(conn, _prams) do
    token = conn.params["token"]

    # assign(conn, :user_token, token)
    case Demo.Token.verify_and_validate(token) do
      {:ok, claims} ->
        IO.inspect(veryfy_user_token_ok: claims["gid"])
        assign(conn, :user_token, claims["gid"])
      _ ->
        IO.inspect(conn: conn)
        conn
    end
  end
end
