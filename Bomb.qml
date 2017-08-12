import QtQuick 2.4

Repeater{
    model:modelBomb

    Item{


        Rectangle{
            id:itemLeft1
            width:main.oGame.convert(main.oGame.getTile() )
            height:main.oGame.convert(main.oGame.getTile() )
            color:"#b3b500"
            visible:false

             radius: main.oGame.convert(20)

            x:( (model.x-1)*main.oGame.convert(main.oGame.getTile()) )
            y:( (model.y)*main.oGame.convert(main.oGame.getTile()) )

            /*
            Image {
                width:parent.width
                height:parent.height
                anchors.centerIn: parent
                source: "/images/wall.png"
            }*/

        }
        Rectangle{
            id:itemLeft2
            width:main.oGame.convert(main.oGame.getTile() )
            height:main.oGame.convert(main.oGame.getTile() )
            color:"#b3b500"
            visible:false

             radius: main.oGame.convert(20)

            x:( (model.x-2)*main.oGame.convert(main.oGame.getTile()) )
            y:( (model.y)*main.oGame.convert(main.oGame.getTile()) )

            /*
            Image {
                width:parent.width
                height:parent.height
                anchors.centerIn: parent
                source: "/images/wall.png"
            }*/

        }

        Rectangle{
            id:itemRight1
            width:main.oGame.convert(main.oGame.getTile() )
            height:main.oGame.convert(main.oGame.getTile() )
            color:"#b3b500"
            visible:false

            radius: main.oGame.convert(20)

            x:( (model.x+1)*main.oGame.convert(main.oGame.getTile()) )
            y:( (model.y)*main.oGame.convert(main.oGame.getTile()) )

            /*
            Image {
                width:parent.width
                height:parent.height
                anchors.centerIn: parent
                source: "/images/wall.png"
            }*/


        }
        Rectangle{
            id:itemRight2
            width:main.oGame.convert(main.oGame.getTile() )
            height:main.oGame.convert(main.oGame.getTile() )
            color:"#b3b500"
            visible:false

            radius: main.oGame.convert(20)

            x:( (model.x+2)*main.oGame.convert(main.oGame.getTile()) )
            y:( (model.y)*main.oGame.convert(main.oGame.getTile()) )

            /*
            Image {
                width:parent.width
                height:parent.height
                anchors.centerIn: parent
                source: "/images/wall.png"
            }*/


        }

        Rectangle{
            id:itemUp1
            width:main.oGame.convert(main.oGame.getTile() )
            height:main.oGame.convert(main.oGame.getTile() )
            color:"#b3b500"
            visible:false

            radius: main.oGame.convert(20)

            x:( (model.x)*main.oGame.convert(main.oGame.getTile()) )
            y:( (model.y-1)*main.oGame.convert(main.oGame.getTile()) )

            /*
            Image {
                width:parent.width
                height:parent.height
                anchors.centerIn: parent
                source: "/images/wall.png"
            }*/


        }
        Rectangle{
            id:itemUp2
            width:main.oGame.convert(main.oGame.getTile() )
            height:main.oGame.convert(main.oGame.getTile() )
            color:"#b3b500"
            visible:false

            radius: main.oGame.convert(20)

            x:( (model.x)*main.oGame.convert(main.oGame.getTile()) )
            y:( (model.y-2)*main.oGame.convert(main.oGame.getTile()) )

            /*
            Image {
                width:parent.width
                height:parent.height
                anchors.centerIn: parent
                source: "/images/wall.png"
            }*/


        }

        Rectangle{
            id:itemDown1
            width:main.oGame.convert(main.oGame.getTile() )
            height:main.oGame.convert(main.oGame.getTile() )
            color:"#b3b500"
            visible:false

            radius: main.oGame.convert(20)

            x:( (model.x)*main.oGame.convert(main.oGame.getTile()) )
            y:( (model.y+1)*main.oGame.convert(main.oGame.getTile()) )

            /*
            Image {
                width:parent.width
                height:parent.height
                anchors.centerIn: parent
                source: "/images/wall.png"
            }*/


        }
        Rectangle{
            id:itemDown2
            width:main.oGame.convert(main.oGame.getTile() )
            height:main.oGame.convert(main.oGame.getTile() )
            color:"#b3b500"
            visible:false

            radius: main.oGame.convert(20)

            x:( (model.x)*main.oGame.convert(main.oGame.getTile()) )
            y:( (model.y+2)*main.oGame.convert(main.oGame.getTile()) )

            /*
            Image {
                width:parent.width
                height:parent.height
                anchors.centerIn: parent
                source: "/images/wall.png"
            }*/


        }


        Rectangle{
            id:item
            width:main.oGame.convert(main.oGame.getTile() )
            height:main.oGame.convert(main.oGame.getTile() )
            color:"#b3b500"

            radius: main.oGame.convert(20)

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

        Timer{
            id:explose1
            interval: 2000
            running:true
            repeat: false
            onTriggered:explose()
        }

        Timer{
            id:explose2
            interval: 2500
            running:true
            repeat: false
            onTriggered: main.oGame.removeBomb(model.index)
        }

        function show(direction_,i_){
            if(direction_==='left'){
                if(i_===1){
                    itemLeft1.visible=true;
                }else{
                    itemLeft2.visible=true;
                }
            }else if(direction_==='right'){
                if(i_===1){
                    itemRight1.visible=true;
                }else{
                    itemRight2.visible=true;
                }
            }else if(direction_==='up'){
                if(i_===1){
                    itemUp1.visible=true;
                }else{
                    itemUp2.visible=true;
                }
            }else if(direction_==='down'){
                if(i_===1){
                    itemDown1.visible=true;
                }else{
                    itemDown2.visible=true;
                }
            }
        }

        function explose(){

            main.oGame.exploseBomb(model.x,model.y);

            var i=0;
            var loopX=0;
            var loopY=0;
            var loopSide='';

            //left
            for(i=1;i<=2;i++){
                loopX=model.x-i;
                loopY=model.y;
                loopSide='left';

                if(main.oGame.tMap[loopY][loopX]===2 ){
                    show(loopSide,i);
                    main.oGame.exploseBomb(loopX,loopY);
                    break;
                }else if(main.oGame.tMap[loopY][loopX]===0 ){
                    show(loopSide,i);
                    main.oGame.exploseBomb(loopX,loopY);
                }else{
                    break;
                }
            }

            //right
            for(i=1;i<=2;i++){
                loopX=model.x+i;
                loopY=model.y;
                loopSide='right';

                if(main.oGame.tMap[loopY][loopX]===2 ){
                    show(loopSide,i);
                    main.oGame.exploseBomb(loopX,loopY);
                    break;
                }else if(main.oGame.tMap[loopY][loopX]===0 ){
                    show(loopSide,i);
                    main.oGame.exploseBomb(loopX,loopY);
                }else{
                    break;
                }
            }


            //up
            for(i=1;i<=2;i++){
                loopX=model.x;
                loopY=model.y-i;
                loopSide='up';

                if(main.oGame.tMap[loopY][loopX]===2 ){
                    show(loopSide,i);
                    main.oGame.exploseBomb(loopX,loopY);
                    break;
                }else if(main.oGame.tMap[loopY][loopX]===0 ){
                    show(loopSide,i);
                    main.oGame.exploseBomb(loopX,loopY);
                }else{
                    break;
                }
            }

            //down
            for(i=1;i<=2;i++){
                loopX=model.x;
                loopY=model.y+i;
                loopSide='down';

                if(main.oGame.tMap[loopY][loopX]===2 ){
                    show(loopSide,i);
                    main.oGame.exploseBomb(loopX,loopY);
                    break;
                }else if(main.oGame.tMap[loopY][loopX]===0 ){
                    show(loopSide,i);
                    main.oGame.exploseBomb(loopX,loopY);
                }else{
                    break;
                }
            }



        }

    }




}
