defmodule DemoWeb.ChatChannel do
  use DemoWeb, :channel
  alias Demo.Chat
  alias Demo.Tolen

  def join("chat:lobby", payload, socket) do
    Process.flag(:trap_exit, true) # 異常時にプロセスが死なない為の設定

    # {:ok, token_with_default_claims} = Token.generate_and_sign()

    # extra_claims = %{"user_id" => "some_id"}
    # token_with_default_plus_custom_claims = Token.generate_and_sign!(extra_claims)

    # {:ok, claims} = Token.verify_and_validate(token)

    # # Example with a different key than the default
    # claims = Token.verify_and_validate!(token, another_key)

   {:ok, socket}
  end

  def handle_in("old_msg", payload, socket) do
    case Chat.save(payload) do
      {:ok, _} ->
        IO.inspect("ok")
      {:error, changeset} ->
        IO.inspect("error")
    end

    broadcast! socket, "new_msg", payload
    {:reply, {:ok, payload}, socket}
  end

  def handle_in("new_msg", payload, socket) do
    case Chat.save(payload) do
      {:ok, _} ->
        IO.inspect("ok")
      {:error, changeset} ->
        IO.inspect("error")
    end

    broadcast! socket, "new_msg", payload
    {:reply, {:ok, payload}, socket}
  end

  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  defp load_messages() do
    Chat.all()
    |> Enum.map(fn messages ->  messages end)
  end

end
