import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_winer/taskDoing.dart';

//详细悬赏信息页
class Task_Infor extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,//居中
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 30),
                child: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: (){
                  Navigator.pop(context,"返回值");
                }),
              ),
              Container(
                margin: EdgeInsets.only(top: 30,left: 150),
                child: Text("悬赏1",style: TextStyle(color: Colors.white,fontSize: 24),),
              )
            ],
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.center,//居中
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 80),
                child: Text("任务类型:",style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
              Container(
                margin: EdgeInsets.only(left: 130),
                child: Text("超市代购",style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
            ],
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.center,//居中
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 80),
                child: Text("任务目标:",style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
            ],
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.center,//居中
            children: <Widget>[
              Container(
                width: 300,
                height: 70,
                color: Colors.white12,
                margin: EdgeInsets.only(left: 80),
                child: Text("吃吃吃吃吃吃吃吃吃",style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
            ],
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.center,//居中
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 80),
                child: Text("详细描述:",style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
            ],
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.center,//居中
            children: <Widget>[
              Container(
                width: 300,
                height: 100,
                color: Colors.white12,
                margin: EdgeInsets.only(left: 80),
                child: Text("吃吃吃吃吃吃吃吃吃",style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
            ],
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.center,//居中
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 80),
                child: Text("任务要求:",style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
            ],
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.center,//居中
            children: <Widget>[
              Container(
                width: 300,
                height: 100,
                color: Colors.white12,
                margin: EdgeInsets.only(left: 80),
                child: Text("吃吃吃吃吃吃吃吃吃",style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
            ],
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.center,//居中
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 80),
                child: Text("任务时限:",style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
            ],
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.center,//居中
            children: <Widget>[
              Container(
                width: 300,
                height: 50,
                color: Colors.white12,
                margin: EdgeInsets.only(left: 80),
                child: Text("吃吃吃吃吃吃吃吃吃",style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
            ],
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.center,//居中
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 80),
                child: Text("赏金:",style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
            ],
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.center,//居中
            children: <Widget>[
              Container(
                width: 300,
                height: 30,
                color: Colors.red,
                margin: EdgeInsets.only(left: 80),
                child: Text("\$10000000",style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
            ],
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.center,//居中
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 80,top: 20),
                width: 300,
                height: 50,
                child:Material(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10.0),
                  elevation: 5.0,
                  child: FlatButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Resk_doing();
                    }));
                  }, child: Container(
                    alignment: Alignment.center,
                    width: 300,
                    height: 50,
                    child: Text("揭榜",style: TextStyle(color: Colors.white,fontSize: 18),),
                  )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
