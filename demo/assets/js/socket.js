// NOTE: The contents of this file will only be executed if
// you uncomment its entry in "assets/js/app.js".

// To use Phoenix channels, the first step is to import Socket,
// and connect at the socket path in "lib/web/endpoint.ex".
//
// Pass the token on params as below. Or remove it
// from the params if you are not using authentication.
import {Socket} from "phoenix"

let socket = new Socket("/socket", { params: { token: window.userToken } })

socket.connect()

let LoginRoom = `chat:${window.userToken}`

// Now that you are connected, you can join channels with a topic:
let channel = socket.channel(LoginRoom, {})
let userInput         = document.querySelector("#user-input")
let chatInput         = document.querySelector("#chat-input")
let messagesContainer = document.querySelector("#messages")

// メッセージの枠でEnterを押すとメッセージが送信される

// メッセージは空にする(ユーザー名はそのまま)
chatInput.addEventListener("keypress", event => {
  if(event.keyCode === 13){
    channel.push("new_msg", {user: userInput.value, chat: chatInput.value})
    chatInput.value = ""
  }
})

// TODO: 送信ボタンでも送信できるように

// TODO: 空文字だと送信できないようにする
channel.on("new_msg", payload => {
  let messageItem = document.createElement("li")
  messageItem.innerText = `[${payload.user}] ${payload.chat}`
  messagesContainer.appendChild(messageItem)
})

channel.join()
  .receive("ok", resp => console.log("Joined successfully", resp))
  .receive("error", resp => console.log("Unable to join", resp))

export default socket
