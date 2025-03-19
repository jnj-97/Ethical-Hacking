const express=require('express')
const app=express()
app.use(express.static('public'))
const expressApp=app.listen(4000);
const socketio=require('socket.io')
const io=socketio(expressApp,{

})

io.on('connect',socket=>{
    console.log(socket.id," has joined our server!")
    socket.on('messageFromClientToServer',newMessage=>{
        io.emit('messageFromServerToAllClients',newMessage)
    })
})