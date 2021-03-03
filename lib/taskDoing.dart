import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'chat.dart';

//执行任务
class Resk_doing extends StatefulWidget{
  @override
  _Resk_doingState createState()=>_Resk_doingState();
}
class _Resk_doingState extends State<Resk_doing>{
  int fag=0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 30),
                child:IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: (){
                  Navigator.pop(context,"返回值");
                }),
              ),
              Container(
                margin: EdgeInsets.only(top:30,left: 300),
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.purple,
                  child: FlatButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Chat();
                    }));
                  }, child: Text("与商家联系",style: TextStyle(color: Colors.white,fontSize: 18),)),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20,left: 40),
                child: Text("正在执行",style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
              Container(
                margin: EdgeInsets.only(top: 20,left: 120),
                child: Text("lalala的赏金任务",style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20,left: 40),
                child: Text("目标",style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
              Container(
                height: 100,
                margin: EdgeInsets.only(top: 20,left: 120),
                child: Column(
                  children: <Widget>[
                    Text("超时购物",style: TextStyle(color: Colors.white,fontSize: 18),),
                    Text("1.娃哈哈酸奶瓶装*1",style: TextStyle(color: Colors.white,fontSize: 18),),
                    Text("2.卫龙辣条*1",style: TextStyle(color: Colors.white,fontSize: 18),),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20,left: 40),
                child: Text("目的地点",style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
              Container(
                margin: EdgeInsets.only(top: 20,left: 120),
                child: Text("留和路后街快递超市",style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            color: Colors.white12,
            height: 250,
            width: 500,
            alignment: Alignment.center,
            child: Text("这里是地图",style: TextStyle(color: Colors.white,fontSize: 36),),
          ),
          Row(
            children: <Widget>[
              Container(
                //color: Colors.red,
                margin: EdgeInsets.only(top: 30),
                child: Text("剩余时间",style: TextStyle(color: Colors.white,fontSize: 24),),
              ),
              Container(
                //color: Colors.red,
                margin: EdgeInsets.only(top: 30),
                child: Text("01:29:56",style: TextStyle(color: Colors.white,fontSize: 24),),
              ),
              Container(
                margin: EdgeInsets.only(left: 100,top: 30),
                child: Text("赏金",style: TextStyle(color: Colors.white,fontSize: 24),),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text("\$100000",style: TextStyle(color: Colors.white,fontSize: 24),),
              ),
            ],
          ),
          Text("悬赏详情",style: TextStyle(color: Colors.white,fontSize: 24),),
          Container(
            width: 500,
            height: 100,
            color: Colors.white12,
          ),
        ],
      ),
      floatingActionButton: Container(
        height: 65,
        width: 65,
        padding: EdgeInsets.all(3.0),
        child: FloatingActionButton(onPressed: (){
          setState(() {
            fag++;
          });
        },
          backgroundColor: fag%2==0?Colors.amberAccent:Colors.red,
          child: Icon(fag%2==0?Icons.lock_open:Icons.lock_outline,size: 30,),
        ),
      ),
      floatingActionButtonLocation: fag%2==0?FloatingActionButtonLocation.endFloat:FloatingActionButtonLocation.centerFloat,
    );
  }
}
