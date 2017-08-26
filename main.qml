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

    function serverIsConnected(){
        stack.currentItem.serverIsConnected();
    }
    function hideBoxClient(){
        stack.currentItem.hideBoxClient();
    }


    function webSocketClient_message(message){
        main.oGame.webSocketClient_receive(message);
    }
    function webSocketServer_message( message ){
        return main.oGame.webSocketServer_receive(message);
    }


    function disableServer(){
        applicationData.disconnectServer();
    }

    function enableServer(port_){
        applicationData.connectServer(port_);
    }

    function webSocketDisconnectServer(){
        applicationData.disconnectClient();
    }

    function webSocketConnectServer(server_){
        applicationData.connectClient(server_);
    }
    function webSocketSendText(text_){
        applicationData.sendMessage(text_);
    }

    contentOrientation :Qt.PortraitOrientation


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
        oGame.start(Screen.width,Screen.height);
        //this.oGame.start(400,650);

    }





    Component.onCompleted:initApplication()

}
