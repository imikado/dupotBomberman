import QtQuick 2.0

Rectangle{
    visible:true
    color:'#d95e22'
    width:main.oGame.getWidth()
    height:main.oGame.getHeight()

        Image{
            width:main.oGame.convert(237)
            height:main.oGame.convert(105)
            source:"/images/pageLogoMobileDupot.jpg"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            smooth: true
        }
        Timer {
            id:timerSplashscreen
            interval: 4000;
            running: true
            repeat: false
            onTriggered: main.oGame.gotoMenu();
        }

}
