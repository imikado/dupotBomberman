import QtQuick 2.0

import "qrc:/items"

Item{
    id:serverSide

    Rectangle {
        id: rectangle
        x: main.oGame.convert(41)
        y: main.oGame.convert(76)
        width: main.oGame.convert(280)
        height: main.oGame.convert(200)
        color: "#ffffff"

        Text {
            id: text1
            x: main.oGame.convert(19)
            y: main.oGame.convert(14)
            text: qsTr("Liste des utilisateurs connectés")
            font.pixelSize: main.oGame.convert(12)
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
            y:main.oGame.convert(200)

            _width: main.oGame.convert(380)
            _height: main.oGame.convert(60)
            _text: qsTr("Jouer!")
            _link:function(){main.webSocketSendText("oo")}


        }
    }


    function webSocketAppendMessage(text_){
        textEdit.text+=text_+"\n";
    }
}
