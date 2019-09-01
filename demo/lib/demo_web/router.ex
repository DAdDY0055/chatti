defmodule DemoWeb.Router do
  use DemoWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
    plug Demo.JwtAuthPlug
  end

  scope "/", DemoWeb do
    pipe_through(:browser)

    get("/", PageController, :index)
  end

  scope "/api", DemoWeb do
    pipe_through :api

    get "/status", StatusController, :index
  end
end
