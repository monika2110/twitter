 import consumer from "./consumer"

consumer.subscriptions.create("ConverationChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
  const storeElement = document.querySelector(div.msgs)
    if (storeElement) {
      storeElement.innerHTML = msg.html
    }
    }
});