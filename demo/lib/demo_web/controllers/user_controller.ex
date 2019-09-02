defmodule DemoWeb.UserController do
  use DemoWeb, :controller

  alias Demo.Auth
  alias Demo.Auth.User

  action_fallback DemoWeb.FallbackController

  # def index(conn, _params) do
  #   users = Auth.list_users()
  #   render(conn, "index.json", users: users)
  # end

  def create(conn, user_params) do
    # def create(conn, %{"gid" => "gid", "group_name" => "group_name", "uid" => "uid", "user_name" =>"user_name"}) do
    # token = generate_and_sign
    IO.inspect(user_params)
    with {:ok, %User{} = user} <- Auth.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  # def show(conn, %{"id" => id}) do
  #   user = Auth.get_user!(id)
  #   render(conn, "show.json", user: user)
  # end

  # def update(conn, %{"id" => id, "user" => user_params}) do
  #   user = Auth.get_user!(id)

  #   with {:ok, %User{} = user} <- Auth.update_user(user, user_params) do
  #     render(conn, "show.json", user: user)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   user = Auth.get_user!(id)

  #   with {:ok, %User{}} <- Auth.delete_user(user) do
  #     send_resp(conn, :no_content, "")
  #   end
  # end
end
