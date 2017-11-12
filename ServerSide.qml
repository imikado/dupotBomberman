import QtQuick 2.0

import "qrc:/items"

Item{
    id:serverSide

    Rectangle{
        x: main.oGame.convert(80)
        y: main.oGame.convert(56)
        width: main.oGame.convert(280)
        height: main.oGame.convert(60)
        color:"#cccccc"
        radius:main.oGame.convert(5)


        Text{
            x:main.oGame.convert(10)
            y:main.oGame.convert(10)

            height:  main.oGame.convert(60)
            width: main.oGame.convert(140)
            text: applicationData.getIp()

            font.pixelSize: main.oGame.convert(32)
        }
    }
    Text{
        x:main.oGame.convert(375)
        y: main.oGame.convert(71)
        color:"#ffffff"
        text:"Port:"
        font.pixelSize: main.oGame.convert(32)
    }

    Rectangle{
        x: main.oGame.convert(465)
        y: main.oGame.convert(56)
        width: main.oGame.convert(140)
        height:  main.oGame.convert(60)

        color:"#ffffff"
        radius:main.oGame.convert(5)

        TextInput{
            id:port
            x:main.oGame.convert(10)
            y:main.oGame.convert(10)

            width: main.oGame.convert(100)
            height:  main.oGame.convert(60)

            text:"1100"

            font.pixelSize: main.oGame.convert(32)

        }
    }

    Bouton{
        id:btnToServe
        x: main.oGame.convert(80)
        y: main.oGame.convert(136)
        _width: main.oGame.convert(530)
        _height: main.oGame.convert(60)
        _text: qsTr("Ecouter sur ce port !")
        _link:function(){applicationData.connectServer(port.text)}
    }



    Rectangle {
        id: rectangleUser
        x: main.oGame.convert(40)
        y: main.oGame.convert(138)
        radius:main.oGame.convert(5)
        width: main.oGame.convert(640)
        height: main.oGame.convert(300)
        color: "#ffffff"
        visible:false

        Text {

            x: main.oGame.convert(19)
            y: main.oGame.convert(14)
            text: "Server listening on "+applicationData.getIp()+":"+port.text
            color:"#224422"
            font.pixelSize: main.oGame.convert(14)

        }

        Text {
            id: text1
            x: main.oGame.convert(19)
            y: main.oGame.convert(34)
            text: qsTr("Liste des utilisateurs connectés")
            font.pixelSize: main.oGame.convert(18)
            font.bold: true
        }

        TextEdit {
            id: textEdit
            x: main.oGame.convert(19)
            y: main.oGame.convert(79)
            width: main.oGame.convert(443)
            height: main.oGame.convert(330)
            text: ""

            activeFocusOnPress: false
            font.pixelSize: main.oGame.convert(12)
        }



        Bouton{
            id:btnConnectGame
            visible:true
            y:main.oGame.convert(360)

            _width: main.oGame.convert(640)
            _height: main.oGame.convert(60)
            _text: qsTr("Se connecter")
            _link:function(){main.oGame.webSocketClient_send("test")}


        }


        Bouton{
            id:btnLaunchGame
            visible:false
            y:main.oGame.convert(360)

            _width: main.oGame.convert(640)
            _height: main.oGame.convert(60)
            _text: qsTr("Lancer la partie!")
            _link:function(){main.oGame.webSocketClient_send("start")}


        }
    }

    function hideBoxClient(){
        btnConnectGame.visible=false;
        btnLaunchGame.visible=true;
    }

    function serverIsConnected(){
        rectangleUser.visible=true;
        btnToServe.visible=false;

        main.oGame._isServer=true;
    }
    function hideBoxUser(){
        rectangleUser.visible=false;
    }

    function webSocketAppendMessage(text_){
        textEdit.text+=text_+"\n";
    }
}
