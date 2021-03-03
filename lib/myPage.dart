import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_winer/releasedTask.dart';
import 'homePage.dart';
import 'likeTask.dart';

//我的页面--page3
class TipRoute extends StatelessWidget{
  TipRoute({
    Key key,
    @required this.text,
  }):super(key:key);
  final String text;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(//列排列
          children: <Widget>[
            //头像和昵称
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 50,left: 30),
                  child: new CircleAvatar(//圆形区域
                    radius: 40.0,//半径
                    backgroundImage: new NetworkImage('https://goss.veer.com/creative/vcg/veer/800water/veer-308713666.jpg',),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 40,left: 20),
                      child: Text("猎人①号",style: TextStyle(color: Colors.white,fontSize: 25),),
                    ),
                    Container(
                      //边框设置
                      width: 60,
                      alignment: Alignment(0,0),//居中
                      decoration: new BoxDecoration(//添加边框
                        color: Colors.black,//背景
                        //设置四周圆角 角度
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        //设置四周边框
                        border: new Border.all(width: 1, color: Colors.red),
                      ),
                      child: Text("Lv 1",style: TextStyle(color: Colors.white,fontSize: 15),),
                    ),
                  ],
                ),
              ],
            ),
            //双栏1
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    FlatButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Like_Rask();
                      }));
                    }, child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment(0,0),//居中
                          margin: EdgeInsets.only(top: 40,left: 60),
                          child: Text("收藏的悬赏",style: TextStyle(color: Colors.white,fontSize: 25),),
                        ),
                        Container(
                          //边框设置
                          width: 60,
                          alignment: Alignment(0,0),//居中
                          margin: EdgeInsets.only(top: 10,left: 60),
                          child: Text("99",style: TextStyle(color: Colors.white,fontSize: 25),),
                        ),
                      ],
                    ))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 40,left: 60),
                      child: Text("已接收的悬赏",style: TextStyle(color: Colors.white,fontSize: 25),),
                    ),
                    Container(
                      //边框设置
                      width: 60,
                      alignment: Alignment(0,0),//居中
                      margin: EdgeInsets.only(top: 10,left: 60),
                      child: Text("99",style: TextStyle(color: Colors.white,fontSize: 25),),
                    ),
                  ],
                ),
              ],
            ),
            //双栏2
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment(0,0),//居中
                      margin: EdgeInsets.only(top: 40,left: 60),
                      child: Text("我接收的悬赏",style: TextStyle(color: Colors.white,fontSize: 25),),
                    ),
                    Container(
                      //边框设置
                      width: 60,
                      alignment: Alignment(0,0),//居中
                      margin: EdgeInsets.only(top: 10,left: 60),
                      child: Text("99",style: TextStyle(color: Colors.white,fontSize: 25),),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 40,left: 60),
                      child: Text("悬赏完成率",style: TextStyle(color: Colors.white,fontSize: 25),),
                    ),
                    Container(
                      //边框设置
                      width: 60,
                      alignment: Alignment(0,0),//居中
                      margin: EdgeInsets.only(top: 10,left: 100),
                      child: Text("99%",style: TextStyle(color: Colors.white,fontSize: 25),),
                    ),
                  ],
                ),
              ],
            ),
            //双栏3
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment(0,0),//居中
                      margin: EdgeInsets.only(top: 40,left: 60),
                      child: Text("已发布的悬赏",style: TextStyle(color: Colors.white,fontSize: 25),),
                    ),
                    Container(
                      //边框设置
                      width: 60,
                      alignment: Alignment(0,0),//居中
                      margin: EdgeInsets.only(top: 10,left: 60),
                      child: Text("99",style: TextStyle(color: Colors.white,fontSize: 25),),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 40,left: 60),
                      child: Text("被完成的悬赏",style: TextStyle(color: Colors.white,fontSize: 25),),
                    ),
                    Container(
                      //边框设置
                      width: 60,
                      alignment: Alignment(0,0),//居中
                      margin: EdgeInsets.only(top: 10,left: 60),
                      child: Text("99",style: TextStyle(color: Colors.white,fontSize: 25),),
                    ),
                  ],
                ),
              ],
            ),
            //双栏4
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment(0,0),//居中
                      margin: EdgeInsets.only(top: 40,left: 60),
                      child: Text("揭榜次数",style: TextStyle(color: Colors.white,fontSize: 25),),
                    ),
                    Container(
                      //边框设置
                      width: 60,
                      alignment: Alignment(0,0),//居中
                      margin: EdgeInsets.only(top: 10,left: 105),
                      child: Text("99",style: TextStyle(color: Colors.white,fontSize: 25),),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 40,left: 105),
                      child: Text("未完成的悬赏",style: TextStyle(color: Colors.white,fontSize: 25),),
                    ),
                    Container(
                      //边框设置
                      width: 60,
                      alignment: Alignment(0,0),//居中
                      margin: EdgeInsets.only(top: 10,left: 100),
                      child: Text("99",style: TextStyle(color: Colors.white,fontSize: 25),),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

      ),
    );
  }
}
