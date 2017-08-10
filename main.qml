import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtWebSockets 1.0


import "/js/Game.js" as Game

Window {
    id:main
    visible: true

    color:"#224422"

    property var oGame

    contentOrientation :Qt.PortraitOrientation

    WebSocketServer {
            port:1027
            accept: true
            id: server
            listen: false



            onClientConnected: {
                webSocket.onTextMessageReceived.connect(function(message) {
                    main.oGame.webSocketServer_receive(message,webSocket);


                    //stack.currentItem.webSocketAppendMessage(qsTr("Server received message: %1").arg(message));
                    //webSocket.sendTextMessage(qsTr("Hello Client!"));
                });
            }
            onErrorStringChanged: {
                stack.currentItem.webSocketAppendMessage("serveur listening "+server.url+"");
                stack.currentItem.webSocketAppendMessage(qsTr("Server error: %1").arg(errorString));
            }

        }

    WebSocket{
        id:client
        url:"ws://localhost:1027"
        active: false

        //onTextMessageReceived:stack.currentItem.webSocketAppendMessage( qsTr("Client received message: %1").arg(message) );
        onTextMessageReceived:main.oGame.webSocketClient_receive(message);


    }

    ListModel{
        id:modelGhost
    }
    ListModel{
        id:modelBall
    }
    ListModel{
        id:modelBigBall
    }
    ListModel{
        id:modelWall
    }

    //le composant qui nous permettra de naviguer dans le jeu
    StackView {
        id: stack
        width: parent.width
        height:parent.height
    }
    function popPage(){
        stack.pop();
    }
    function launchPage(sView){
        return stack.push('qrc:/pages/'+sView+'.qml');
    }
    function initApplication(){
        this.oGame=Game;
        oGame.start(Screen.width,Screen.height);
        //this.oGame.start(400,650);

    }

    function enableServer(port_){
        server.port=port_;

        //server.accept=true;
        server.listen=true;

        console.log('eanble server on port : '+port_);

    }

    function webSocketConnectServer(server_){
        client.url=server_;
        console.log('connect to '+server_);
    }
    function webSocketSendText(text_){
        client.active=true;
        client.sendTextMessage(text_);


        console.log('client send message:'+text_);
    }



    Component.onCompleted:initApplication()

}
