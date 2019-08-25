defmodule DemoWeb.ChatChannel do
  use DemoWeb, :channel

  def join("chat:lobby", payload, socket) do
    Process.flag(:trap_exit, true) # 異常時にプロセスが死なない為の設定
   {:ok, socket}
  end

  def handle_in("new_msg", payload, socket) do
    broadcast! socket, "new_msg", payload
    {:reply, {:ok, payload}, socket}
  end

  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  defp load_messages() do
    Agent.get(Demo.History, fn messages -> Enum.reverse(messages) end)
  end

  defp save_message(message) do
    Agent.update(Demo.History, fn messages -> [message | messages] end)
  end

end
