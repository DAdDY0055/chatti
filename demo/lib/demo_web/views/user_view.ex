defmodule DemoWeb.UserView do
  use DemoWeb, :view
  alias DemoWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      uid: user.uid,
      user_name: user.user_name,
      gid: user.gid,
      group_name: user.group_name}
  end

  def render("token.json", %{token: token}) do
    %{token: token}
  end
end
