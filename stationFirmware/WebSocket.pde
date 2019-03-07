import websockets.*;
WebsocketClient stationSocket;

void instanceSocket() {
  stationSocket= new WebsocketClient(this, "ws://localhost:8025/john");
}

void webSocketEvent(String msg) {
  println(msg+" c");
  //newEllipse=true;
}
