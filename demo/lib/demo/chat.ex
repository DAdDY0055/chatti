defmodule Demo.Chat do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  alias Demo.Repo

  schema "chats" do
    field :chat, :string
    field :user, :string

    timestamps()
  end

  @doc false
  def changeset(chat, attrs) do
    chat
    |> cast(attrs, [:user, :chat])
    |> validate_required([:user, :chat])
  end

  def all do
    query = select(__MODULE__, [c], c)
    Repo.all(query)
  end

  def save(payload) do
    changeset = changeset(__struct__, payload)

    Repo.insert(changeset)
  end
end
