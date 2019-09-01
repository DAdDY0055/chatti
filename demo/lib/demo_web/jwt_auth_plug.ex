defmodule Demo.JwtAuthPlug do
  import Plug.Conn
  alias Demo.JwtAuthToken

  def init(opts), do: opts

  def call(conn, _opts) do
    IO.inspect(conn)
    # case JwtAuthToken.decode(jwt_from_map, public_key) do
    #   { :success, %{token: token, claims: claims} } ->
    #     conn |> success(claims)
      # { :error, error } ->
        conn |> forbidden
    # end
  end

  defp jwt_from_cookie(conn) do
    conn
    |> Plug.Conn.get_req_header("cookie")
    |> List.first
    |> Plug.Conn.Cookies.decode
    |> token_from_map(conn)
  end

  defp token_from_map(%{"session_jwt" => jwt}, _conn), do: jwt

  defp token_from_map(_cookie_map, conn) do
    conn
    |> forbidden
  end

  defp forbidden(conn) do
    conn
    |> put_status(:unauthorized)
    |> Phoenix.Controller.render(MyAppWeb.ErrorView, "401.html")
    |> halt
  end
end
