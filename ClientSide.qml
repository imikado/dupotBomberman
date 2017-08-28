import QtQuick 2.0

import "qrc:/items"


Item {


    Rectangle{
        x:main.oGame.convert(100)
        y:main.oGame.convert(50)
        radius:main.oGame.convert(10)


        color:"#ffffff"
        width: main.oGame.convert(300)
        height: main.oGame.convert(40)

        TextInput{
            x:main.oGame.convert(10)
            y:main.oGame.convert(5)
            id:serverUrl
            text:main.oGame._urlWebsocket
            width: main.oGame.convert(300)
            height: main.oGame.convert(40)
            cursorVisible: true
            focus: true

            font.pixelSize: main.oGame.convert(22)


        }




    }
    Text{
        x:main.oGame.convert(410)
        y:main.oGame.convert(55)
        color:"#ffffff"

        text:"Port"

        font.pixelSize: main.oGame.convert(22)
    }

    Rectangle{
        x:main.oGame.convert(500)
        y:main.oGame.convert(50)
        radius:main.oGame.convert(10)


        color:"#ffffff"
        width: main.oGame.convert(100)
        height: main.oGame.convert(40)

        TextInput{
            x:main.oGame.convert(10)
            y:main.oGame.convert(5)
            id:serverUrlPort
            text:main.oGame._urlWebsocketPort
            width: main.oGame.convert(100)
            height: main.oGame.convert(40)
            cursorVisible: true

            font.pixelSize: main.oGame.convert(22)
        }


    }



    Rectangle{
        x:main.oGame.convert(40)
        y:main.oGame.convert(150)
        radius:main.oGame.convert(10)

        color:"#ffffff"
        width: main.oGame.convert(640)
        height: main.oGame.convert(440)
        Text{
            id:textlog
            wrapMode: TextEdit.Wrap

        }
    }

    function webSocketAppendMessage(text_){
        textlog.text+=text_;
    }

    Bouton{
        id:btnConnect
        visible:true
        y:main.oGame.convert(610)
        x:main.oGame.convert(40)

        _width: main.oGame.convert(640)
        _height: main.oGame.convert(60)
        _text: qsTr("Se connecter!")
        _link:function(){

            main.oGame._urlWebsocket=serverUrl.text;

            main.oGame.webSocketClient_send("connect");

            connect.start();



        }


    }
    function connectGame1(){


        //main.oGame.webSocketClient_send("test");

        //connect2.start();
    }
    function connectGame2(){
        main.oGame.webSocketClient_send("test");
    }

    function hideBoxClient(){
        btnConnect.visible=false;

    }

    Timer{
        id:connect
        running: false
        onTriggered: connectGame1();
        interval: 600
    }
    Timer{
        id:connect2
        running: false
        onTriggered: connectGame2();
        interval: 3000
    }

}
