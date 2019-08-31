defmodule DemoWeb.PageController do
  use DemoWeb, :controller
  alias Demo.Chat

  def index(conn, _params) do
    chats = Chat.all
    render(conn, "index.html", chats: chats)  end
end
