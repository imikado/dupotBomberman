import QtQuick 2.0

Item {


    function changeDir (direction_){
        if(direction_ === "L"){
            main.oGame.clickLeft();
        }else if(direction_ === "R"){
            main.oGame.clickRight();
        }else if(direction_ === "D"){
            main.oGame.clickDown();
        }else if(direction_ === "U"){
            main.oGame.clickUp();
        }
    }


    MouseArea{
        id:mouseArea
        anchors.fill: parent

        property variant previousPosition

        onPressed: {
                previousPosition = Qt.point(mouseX, mouseY)
        }
        onReleased:{

            var deltaX=mouseX-previousPosition.x;
            var deltaY=mouseY-previousPosition.y;

            var absoluteX=Math.abs(deltaX);
            var absoluteY=Math.abs(deltaY);

            if(absoluteX > absoluteY){
                if(deltaX > 0){
                    changeDir("R");
                }else if(deltaX < 0){
                    changeDir("L");
                }
            }else{
                if(deltaY > 0){
                    changeDir("D");
                }else if(deltaY < 0){
                    changeDir("U");
                }
            }


        }


    }
}
