import QtQuick 2.4
import QtGraphicalEffects 1.0
Item {
    x:0
    y:0
    property int _width;
    property int _height;
    property string _text;
    property var _link;

    width:_width
    height:_height

    Rectangle {
        id: rectangle1
        color: "#d95e22"
        radius: 3
        x:0
        y:0
        width:_width
        height:_height

        Text {
            anchors.centerIn: parent
            text: qsTr(_text)
            color:"#ffffff"
            font.pixelSize: main.oGame.convert( 25)
        }

        MouseArea{
            anchors.fill: parent
            onPressed:_link()
        }

    }
    DropShadow {
        anchors.fill: rectangle1
        horizontalOffset: 3
        verticalOffset: 3
        radius: 1.0
        samples: 8
        color: "#80000000"
        source: rectangle1
    }
}
