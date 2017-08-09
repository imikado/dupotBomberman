import QtQuick 2.0

Item{


    width:main.oGame.convert(180)
    height:main.oGame.convert(180)


    Rectangle{
        id:rect1
        color:"#131564"
        width:main.oGame.convert(180)
        height:main.oGame.convert(90)
        radius: main.oGame.convert(20)


        Image{
            source: "/images/btnUp.png"

            width:parent.width- main.oGame.convert(40)
            height: parent.height- main.oGame.convert(40)
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.verticalCenter:  parent.verticalCenter;
        }

        MouseArea{
            anchors.fill: parent
            onPressed:clickBtnUp();

        }



        SequentialAnimation on color {
            loops: 1
            id:rect1Anim;
            running:false;
            ColorAnimation { from: "#131564"; to: "#991600"; duration: 200 }
            ColorAnimation { from: "#991600"; to: "#131564"; duration: 500 }
        }
    }

    Rectangle{
        id:rect2
        color:"#131564"
        width:main.oGame.convert(180)
        height:main.oGame.convert(90)
        radius: main.oGame.convert(20)


        anchors.top:rect1.bottom
        anchors.topMargin: main.oGame.convert(2);

        Image{
            source: "/images/btnDown.png"

            width:parent.width- main.oGame.convert(40)
            height: parent.height- main.oGame.convert(40)
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.verticalCenter:  parent.verticalCenter;
        }

        MouseArea{
            anchors.fill: parent
            onPressed:clickBtnDown();
        }

        SequentialAnimation on color {
            loops: 1
            id:rect2Anim;
            running:false;
            ColorAnimation { from: "#131564"; to: "#991600"; duration: 200 }
            ColorAnimation { from: "#991600"; to: "#131564"; duration: 500 }
        }


    }

    function clickBtnUp(){
        main.oGame.clickUp();

        rect1Anim.start();
    }

    function clickBtnDown(){
        main.oGame.clickDown();

        rect2Anim.start();
    }

}
