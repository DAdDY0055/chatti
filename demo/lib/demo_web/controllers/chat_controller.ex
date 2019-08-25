defmodule DemoWeb.ChatController do
  use DemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def create(conn, _params) do
    
  end
end
