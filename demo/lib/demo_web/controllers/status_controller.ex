defmodule Demo.StatusController do
  use DemoWeb, :controller

  def index(conn, _params) do
    status = %{
      success: true
    }
    render(conn, "status.json", status: status)
  end
end
