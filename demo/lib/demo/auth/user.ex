defmodule Demo.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :gid, :integer
    field :group_name, :string
    field :uid, :integer
    field :user_name, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:uid, :user_name, :gid, :group_name])
    |> validate_required([:uid, :user_name, :gid, :group_name])
  end
end
