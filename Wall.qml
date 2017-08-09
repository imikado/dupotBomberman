import QtQuick 2.4

Repeater{
    model:modelWall

    Rectangle{
        id:item
        width:main.oGame.convert(main.oGame.getTile() )
        height:main.oGame.convert(main.oGame.getTile() )
        color:"#497f91"

        radius: main.oGame.convert(10)

        x:(model.x*main.oGame.convert(main.oGame.getTile()) )
        y:(model.y*main.oGame.convert(main.oGame.getTile()) )

        /*
        Image {
            width:parent.width
            height:parent.height
            anchors.centerIn: parent
            source: "/images/wall.png"
        }*/
    }


}
