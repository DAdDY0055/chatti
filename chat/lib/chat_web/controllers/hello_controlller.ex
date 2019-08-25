defmodule ChatWeb.HelloController do
  use ChatWeb, :controller

  def hello(conn, params) do
    name = params["name"]
    render(conn, "hello.html", %{who: name})
  end
end
