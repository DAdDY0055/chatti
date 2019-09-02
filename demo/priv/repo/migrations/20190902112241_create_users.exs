defmodule Demo.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :uid, :integer
      add :user_name, :string
      add :gid, :integer
      add :group_name, :string

      timestamps()
    end

  end
end
