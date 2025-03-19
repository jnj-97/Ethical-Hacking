const socket=io("http://localhost:4000")
var ourchat=""
socket.on('messageFromServerToAllClients',newMessage=>{
    document.getElementById('messages').innerHTML+=`<li class="${newMessage==ourchat?'text-start':'text-end'}">${newMessage}</li>`
})

document.getElementById("messages-form").addEventListener('submit',event=>{
    event.preventDefault()
    const newMessage=document.getElementById('user-message').value
    ourchat=newMessage
    document.getElementById('user-message').value=""
    socket.emit('messageFromClientToServer',newMessage)
})