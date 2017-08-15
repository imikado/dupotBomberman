import QtQuick 2.4

Repeater{
    model:modelBomb

    Item{


        Rectangle{
            id:itemLeft1
            width:main.oGame.convert(main.oGame.getTile() )
            height:main.oGame.convert(main.oGame.getTile() )
            color:"transparent"
            visible:false

             radius: main.oGame.convert(20)

            x:( (model.x-1)*main.oGame.convert(main.oGame.getTile()) )
            y:( (model.y)*main.oGame.convert(main.oGame.getTile()) )

            AnimatedSprite {

                id:itemLeft1Sprite

                width:parent.width
                height:parent.height
                anchors.centerIn: parent
                source: "/images/bombExplose.png"
                frameCount: 3

                frameDuration: 400

                frameWidth:  80
                frameHeight: 80
            }

        }
        Rectangle{
            id:itemLeft2
            width:main.oGame.convert(main.oGame.getTile() )
            height:main.oGame.convert(main.oGame.getTile() )
            color:"transparent"
            visible:false

             radius: main.oGame.convert(20)

            x:( (model.x-2)*main.oGame.convert(main.oGame.getTile()) )
            y:( (model.y)*main.oGame.convert(main.oGame.getTile()) )

            AnimatedSprite {

                id:itemLeft2Sprite

                width:parent.width
                height:parent.height
                anchors.centerIn: parent
                source: "/images/bombExplose.png"
                frameCount: 3

                frameDuration: 400

                frameWidth:  80
                frameHeight: 80
            }

        }

        Rectangle{
            id:itemRight1
            width:main.oGame.convert(main.oGame.getTile() )
            height:main.oGame.convert(main.oGame.getTile() )
            color:"transparent"
            visible:false

            radius: main.oGame.convert(20)

            x:( (model.x+1)*main.oGame.convert(main.oGame.getTile()) )
            y:( (model.y)*main.oGame.convert(main.oGame.getTile()) )

            AnimatedSprite {

                id:itemRight1Sprite

                width:parent.width
                height:parent.height
                anchors.centerIn: parent
                source: "/images/bombExplose.png"
                frameCount: 3

                frameDuration: 400

                frameWidth:  80
                frameHeight: 80
            }


        }
        Rectangle{
            id:itemRight2
            width:main.oGame.convert(main.oGame.getTile() )
            height:main.oGame.convert(main.oGame.getTile() )
            color:"transparent"
            visible:false

            radius: main.oGame.convert(20)

            x:( (model.x+2)*main.oGame.convert(main.oGame.getTile()) )
            y:( (model.y)*main.oGame.convert(main.oGame.getTile()) )

            AnimatedSprite {

                id:itemRight2Sprite

                width:parent.width
                height:parent.height
                anchors.centerIn: parent
                source: "/images/bombExplose.png"
                frameCount: 3

                frameDuration: 400

                frameWidth:  80
                frameHeight: 80
            }


        }

        Rectangle{
            id:itemUp1
            width:main.oGame.convert(main.oGame.getTile() )
            height:main.oGame.convert(main.oGame.getTile() )
            color:"transparent"
            visible:false

            radius: main.oGame.convert(20)

            x:( (model.x)*main.oGame.convert(main.oGame.getTile()) )
            y:( (model.y-1)*main.oGame.convert(main.oGame.getTile()) )

            AnimatedSprite {

                id:itemUp1Sprite

                width:parent.width
                height:parent.height
                anchors.centerIn: parent
                source: "/images/bombExplose.png"
                frameCount: 3

                frameDuration: 400

                frameWidth:  80
                frameHeight: 80
            }


        }
        Rectangle{
            id:itemUp2
            width:main.oGame.convert(main.oGame.getTile() )
            height:main.oGame.convert(main.oGame.getTile() )
            color:"transparent"
            visible:false

            radius: main.oGame.convert(20)

            x:( (model.x)*main.oGame.convert(main.oGame.getTile()) )
            y:( (model.y-2)*main.oGame.convert(main.oGame.getTile()) )

            AnimatedSprite {

                id:itemUp2Sprite

                width:parent.width
                height:parent.height
                anchors.centerIn: parent
                source: "/images/bombExplose.png"
                frameCount: 3

                frameDuration: 400

                frameWidth:  80
                frameHeight: 80
            }


        }

        Rectangle{
            id:itemDown1
            width:main.oGame.convert(main.oGame.getTile() )
            height:main.oGame.convert(main.oGame.getTile() )
            color:"transparent"
            visible:false

            radius: main.oGame.convert(20)

            x:( (model.x)*main.oGame.convert(main.oGame.getTile()) )
            y:( (model.y+1)*main.oGame.convert(main.oGame.getTile()) )

            AnimatedSprite {

                id:itemDown1Sprite

                width:parent.width
                height:parent.height
                anchors.centerIn: parent
                source: "/images/bombExplose.png"
                frameCount: 3

                frameDuration: 400

                frameWidth:  80
                frameHeight: 80
            }


        }
        Rectangle{
            id:itemDown2
            width:main.oGame.convert(main.oGame.getTile() )
            height:main.oGame.convert(main.oGame.getTile() )
            color:"transparent"
            visible:false

            radius: main.oGame.convert(20)

            x:( (model.x)*main.oGame.convert(main.oGame.getTile()) )
            y:( (model.y+2)*main.oGame.convert(main.oGame.getTile()) )

            AnimatedSprite {

                id:itemDown2Sprite

                width:parent.width
                height:parent.height
                anchors.centerIn: parent
                source: "/images/bombExplose.png"
                frameCount: 3

                frameDuration: 400

                frameWidth:  80
                frameHeight: 80
            }


        }

        Rectangle{
            id:itemExplose
            width:main.oGame.convert(main.oGame.getTile() )
            height:main.oGame.convert(main.oGame.getTile() )
            color:"transparent"
            visible:false

            radius: main.oGame.convert(20)

            x:( (model.x)*main.oGame.convert(main.oGame.getTile()) )
            y:( (model.y)*main.oGame.convert(main.oGame.getTile()) )

            AnimatedSprite {

                id:itemExploseSprite

                width:parent.width
                height:parent.height
                anchors.centerIn: parent
                source: "/images/bombExplose.png"
                frameCount: 3

                frameDuration: 400

                frameWidth:  80
                frameHeight: 80
            }


        }


        Rectangle{
            id:item
            width:main.oGame.convert(main.oGame.getTile() )
            height:main.oGame.convert(main.oGame.getTile() )
            color:"transparent"

            x:(model.x*main.oGame.convert(main.oGame.getTile()) )
            y:(model.y*main.oGame.convert(main.oGame.getTile()) )

            AnimatedSprite {

                width:parent.width
                height:parent.height
                anchors.centerIn: parent
                source: "/images/bomb.png"
                frameCount: 3

                frameDuration: 400

                frameWidth:  80
                frameHeight: 80
            }


        }

        Timer{
            id:explose1
            interval: 5000
            running:true
            repeat: false
            onTriggered:explose()
        }

        Timer{
            id:explose2
            interval: 7500
            running:true
            repeat: false
            onTriggered: main.oGame.removeBomb(model.index)
        }

        function show(direction_,i_){

            var currentItem='';
            var currentItemSprite='';

            if(direction_==='left'){
                if(i_===1){
                    currentItem=itemLeft1;
                    currentItemSprite=itemLeft1Sprite;
                }else{
                    currentItem=itemLeft2;
                    currentItemSprite=itemLeft2Sprite
                }
            }else if(direction_==='right'){
                if(i_===1){
                    currentItem=itemRight1;
                    currentItemSprite=itemRight1Sprite;
                }else{
                    currentItem=itemRight2;
                    currentItemSprite=itemRight2Sprite;
                }
            }else if(direction_==='up'){
                if(i_===1){
                    currentItem=itemUp1;
                    currentItemSprite=itemUp1Sprite;
                }else{
                    currentItem=itemUp2;
                    currentItemSprite=itemUp2Sprite;
                }
            }else if(direction_==='down'){
                if(i_===1){
                    currentItem=itemDown1;
                    currentItemSprite=itemDown1Sprite;
                }else{
                    currentItem=itemDown2;
                    currentItemSprite=itemDown2Sprite;
                }
            }

            currentItem.visible=true;
            currentItemSprite.restart();

        }

        function explose(){

            item.visible=false;
            itemExplose.visible=true;
            itemExploseSprite.restart();

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
