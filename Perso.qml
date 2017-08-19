import QtQuick 2.4

Repeater{
    model:modelPerso

    Rectangle{
        id:item
        width:main.oGame.convert(main.oGame.getTile() )
        height:main.oGame.convert(main.oGame.getTile() )
        color:"transparent"

        visible:model.visible

        radius: main.oGame.convert(10)

        x:(model.x*main.oGame.convert(main.oGame.getTile()) )
        y:(model.y*main.oGame.convert(main.oGame.getTile()) )-main.oGame.convert(20)

        /*
        Image {
            width:parent.width
            height:parent.height
            anchors.centerIn: parent
            source: "/images/wall.png"
        }*/

        Behavior on x  { SmoothedAnimation { velocity: 100 } }
        Behavior on y  { SmoothedAnimation { velocity: 100 } }

        AnimatedSprite {


            id:itemLeft2Sprite

            width:parent.width
            height:parent.height
            anchors.centerIn: parent
            source: "/images/"+model.img+".png"
            frameCount: 3

            frameDuration: 120
            interpolate:true


            frameWidth:  80
            frameHeight: 80
        }

    }


}
