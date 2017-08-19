import QtQuick 2.0

import "qrc:/items"

Item{
    id:serverSide

    Rectangle{
        x: main.oGame.convert(100)
        y: main.oGame.convert(26)
        width: main.oGame.convert(240)
        height: main.oGame.convert(40)
        color:"#cccccc"
        radius:main.oGame.convert(5)


        Text{
            x:main.oGame.convert(10)
            y:main.oGame.convert(5)

            height:  main.oGame.convert(40)
            width: main.oGame.convert(140)
            text: applicationData.getIp()
        }
    }
    Rectangle{
        x: main.oGame.convert(355)
        y: main.oGame.convert(26)
        width: main.oGame.convert(140)
        height:  main.oGame.convert(40)

        color:"#ffffff"
        radius:main.oGame.convert(5)

        TextInput{
            id:port
            x:main.oGame.convert(10)
            y:main.oGame.convert(5)

            width: main.oGame.convert(100)
            height:  main.oGame.convert(40)

            text:"1100"

        }
    }

    Bouton{
        id:btnToServe
        x:main.oGame.convert(500)
        y: main.oGame.convert(26)
        _width: main.oGame.convert(60)
        _height: main.oGame.convert(40)
        _text: qsTr("Go!")
        _link:function(){main.enableServer(port.text)}
    }



    Rectangle {
        id: rectangleUser
        x: main.oGame.convert(40)
        y: main.oGame.convert(118)
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
            y:main.oGame.convert(360)

            _width: main.oGame.convert(640)
            _height: main.oGame.convert(60)
            _text: qsTr("Lancer la partie!")
            _link:function(){main.oGame.webSocketClient_send("start")}


        }
    }

    function showBoxUser(){
        console.log("show box user");
        rectangleUser.visible=true;
        btnToServe.visible=false;
    }
    function hideBoxUser(){
        rectangleUser.visible=false;
    }

    function webSocketAppendMessage(text_){
        textEdit.text+=text_+"\n";
    }
}
