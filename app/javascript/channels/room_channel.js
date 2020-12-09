import consumer from "./consumer";

document.addEventListener("turbolinks:load", function () {
  
  console.log("Cargó la página");

  


  let roomClient = consumer.subscriptions.create("RoomChannel", {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      console.log(data);
    }
  });

  // document.querySelector("#pinger").addEventListener("click", function () {
  //   // Enviar un mensaje al server de WS
  //   console.log("Enviando mensaje");

  //   roomClient.send({
  //     message: prompt("Escribe el mensaje")
  //   })
  // });

});