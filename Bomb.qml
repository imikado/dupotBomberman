import QtQuick 2.4

Repeater{
    model:modelBomb

    Item{

        property string attrActionExplose:model.actionExplose

        onAttrActionExploseChanged:{ if(attrActionExplose==='true') explose(); }

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
            interval: 4000
            running:model.isTimerActive
            repeat: false
            onTriggered:main.oGame.socketExplose(model.index)
        }

        Timer{
            id:explose2
            interval: 4500
            running:model.isTimerActive
            repeat: false
            onTriggered: main.oGame.socketRemoveBomb(model.x,model.y)
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

            console.log('explose');


            var modelX=model.x;
            var modelY=model.y;

            item.visible=false;
            itemExplose.visible=true;
            itemExploseSprite.restart();

            main.oGame.exploseBomb(modelX,modelY);

            var i=0;
            var loopX=0;
            var loopY=0;
            var loopSide='';

            var tDirection=Array('left','right','up','down');

            for(var iDirection in tDirection){

                var sDirection=tDirection[iDirection];

                //left
                for(i=1;i<=2;i++){

                    if(sDirection==='left'){
                        loopX=modelX-i;
                        loopY=modelY;
                    }else if(sDirection==='right'){
                        loopX=modelX+i;
                        loopY=modelY;
                    }else if(sDirection==='up'){
                        loopX=modelX;
                        loopY=modelY-i;
                    }else if(sDirection==='down'){
                        loopX=modelX;
                        loopY=modelY+i;
                    }

                    loopSide=sDirection;

                    if(main.oGame._oMap.isWallBreakable(loopY,loopX) ){
                        show(loopSide,i);
                        main.oGame.exploseBomb(loopX,loopY);
                        break;
                    }else if(main.oGame._oMap.isEmpty(loopY,loopX) ){
                        show(loopSide,i);
                        main.oGame.exploseBomb(loopX,loopY);
                    }else{
                        break;
                    }
                }
            }





        }

    }




}
