import QtQuick 2.0

import "qrc:/items"

Item{
    id:serverSide

    Rectangle{
        x: main.oGame.convert(340)
        y: main.oGame.convert(16)
        width: main.oGame.convert(300)
        height: main.oGame.convert(30)

        Text{
            x:main.oGame.convert(5)
            height:  main.oGame.convert(30)
            width: main.oGame.convert(140)
            text: applicationData.getIp()+ " port : "
        }


        TextInput{
            id:port
            x:main.oGame.convert(220)
            width: main.oGame.convert(100)
            text:"1100"

        }


        Bouton{
            x:main.oGame.convert(300)

            _width: main.oGame.convert(60)
            _height: main.oGame.convert(30)
            _text: qsTr("Go!")
            _link:function(){main.enableServer(port.text)}
        }
    }


    Rectangle {
        id: rectangle
        x: main.oGame.convert(41)
        y: main.oGame.convert(76)
        width: main.oGame.convert(480)
        height: main.oGame.convert(200)
        color: "#ffffff"

        Text {
            id: text1
            x: main.oGame.convert(19)
            y: main.oGame.convert(14)
            text: qsTr("Liste des utilisateurs connectés")
            font.pixelSize: main.oGame.convert(14)
        }

        TextEdit {
            id: textEdit
            x: main.oGame.convert(19)
            y: main.oGame.convert(49)
            width: main.oGame.convert(243)
            height: main.oGame.convert(130)
            text: ""

            activeFocusOnPress: false
            font.pixelSize: main.oGame.convert(12)
        }





        Bouton{
            y:main.oGame.convert(250)

            _width: main.oGame.convert(380)
            _height: main.oGame.convert(60)
            _text: qsTr("Jouer!")
            _link:function(){main.oGame.webSocketClient_send("start")}


        }
    }


    function webSocketAppendMessage(text_){
        textEdit.text+=text_+"\n";
    }
}
