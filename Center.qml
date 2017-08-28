import QtQuick 2.0

Item{


    width:main.oGame.convert(260)
    height:main.oGame.convert(90)


    Rectangle{
        id:rect1
        color:"#3f1364"
        width:parent.width
        height:parent.height
        radius: main.oGame.convert(20)


        AnimatedSprite {

            width:main.oGame.convert( 50)
            height:main.oGame.convert( 50)
            anchors.horizontalCenter:  parent.horizontalCenter
             anchors.verticalCenter:  parent.verticalCenter;
            source: "/images/bomb.png"
            frameCount: 3

            frameDuration: 400

            frameWidth:  80
            frameHeight: 80
        }

        MouseArea{
            id:mousea
            anchors.fill: parent
            onPressed:clickBtnBomb();

        }




    }



    function clickBtnBomb(){
        main.oGame.clickBomb();

    }

    function disable(){
        mousea.enabled=false;
        rect1.opacity=0.5;
    }
    function enable(){
        mousea.enabled=true;
        rect1.opacity=1;
    }


}
