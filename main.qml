import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtWebSockets 1.0


import "/js/Game.js" as Game

Window {
    id:main
    objectName:"main"
     visible: true

    color:"#224422"

    property var oGame

    function showBoxUser(){
        stack.currentItem.showBoxUser();
    }
    function hideBoxClient(){
        stack.currentItem.hideBoxClient();
    }

    function webSocketClient_message(message){
        console.log('receive QML webSocketClient_receive '+message);
        main.oGame.webSocketClient_receive(message);
    }
    function webSocketServer_message( message ){
        console.log('receive QML webSocketServer_receive '+message);
        return main.oGame.webSocketServer_receive(message);
    }

    contentOrientation :Qt.PortraitOrientation

    /*
    WebSocketServer {

            port:1100
            accept: true
            id: server
            listen: true




            onClientConnected: {
                webSocket.onTextMessageReceived.connect(function(message) {
                    main.oGame.webSocketServer_receive(message,webSocket);


                    //stack.currentItem.webSocketAppendMessage(qsTr("Server received message: %1").arg(message));
                    //webSocket.sendTextMessage(qsTr("Hello Client!"));
                });
            }
            onAcceptChanged: {
                stack.currentItem.webSocketAppendMessage("serveur listening "+server.url+"");

            }

            onErrorStringChanged: {
                stack.currentItem.webSocketAppendMessage("serveur listening "+server.url+"");
                stack.currentItem.webSocketAppendMessage(qsTr("Server error: %1").arg(errorString));
            }

        }

    WebSocket{
        id:client
        active: false
        url:server.url

        //onTextMessageReceived:stack.currentItem.webSocketAppendMessage( qsTr("Client received message: %1").arg(message) );
        onTextMessageReceived:main.oGame.webSocketClient_receive(server.url+')'+message);
        onErrorStringChanged: main.oGame.webSocketClient_receive(errorString);


    }
    */

    ListModel{
        id:modelPerso
    }

    ListModel{
        id:modelWall
    }

    ListModel{
        id:modelWallBreakable
    }

    ListModel{
        id:modelBomb
    }

    /*
    ListModel{
        id:modelBoom
    }*/

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

        console.log('mon ip'+applicationData.getIp());
        this.oGame=Game;
        //oGame.start(Screen.width,Screen.height);
        this.oGame.start(400,650);

    }

    function enableServer(port_){

        applicationData.connectServer(port_);

        //server.url='ws://'+applicationData.getIp();
        //server.host=applicationData.getIp();
        //server.host='127.0.0.1';
        //server.host='localhost';
        //server.port=port_;

        //server.accept=true;
        //server.listen=true;


        console.log('eanble server on port : '+port_);

    }

    function webSocketConnectServer(server_){

        applicationData.connectClient(server_);

        //client.url=server_;

        //if(client.errorString){
         //   console.log('error:'+client.errorString);
        //}


        console.log('connect to '+server_);
    }
    function webSocketSendText(text_){

        applicationData.sendMessage(text_);

        /*client.active=true;
        client.sendTextMessage(text_);


        if(client.errorString){

            console.log('error:'+client.errorString+' '+client.closeReason );
           // main.oGame.bConnected=false;
        }
        */

        console.log('client send message:'+text_);
    }




    Component.onCompleted:initApplication()

}
