import QtQuick 2.0

import "qrc:/items"


Item {


    Rectangle{
        color:"#ffffff"
        width: main.oGame.convert(380)
        height: main.oGame.convert(40)
        TextEdit{
            id:serverUrl
            text:"ws://localhost:1027"

        }
    }

    Rectangle{
        y:main.oGame.convert(50)
        color:"#ffffff"
        width: main.oGame.convert(380)
        height: main.oGame.convert(140)
        Text{
            id:textlog
            wrapMode: TextEdit.Wrap

        }
    }

    function webSocketAppendMessage(text_){
        textlog.text+=text_;
    }

    Bouton{
        y:main.oGame.convert(200)

        _width: main.oGame.convert(380)
        _height: main.oGame.convert(60)
        _text: qsTr("Se connecter!")
        _link:function(){

            main.oGame.webSocketClient_send("test");


        }


    }

}
