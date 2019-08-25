defmodule Demo.Repo.Migrations.CreateChats do
  use Ecto.Migration

  def change do
    create table(:chats) do
      add :user, :string
      add :chat, :string

      timestamps()
    end

  end
end

