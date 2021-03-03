import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'myPubedTask.dart';


//发布悬赏
class Release_Resk extends StatefulWidget{
  @override
  _Release_ReskState createState()=>_Release_ReskState();
}
class _Release_ReskState extends State<Release_Resk>{
  var _value;
  //var _isUp=0;
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
                child: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: (){
                  Navigator.pop(context,"返回值");
                }),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text("发布悬赏",style: TextStyle(color: Colors.white,fontSize: 24),),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20,left: 40),
                child: Text("悬赏类型",style: TextStyle(color:Colors.white,fontSize: 18),),
              ),
              Container(
                //color: Colors.white38,
                width: 200,
                margin: EdgeInsets.only(top: 20,left: 80),
                child: DropdownButton(
                    value: _value,//更改值,来实现选择
                    underline: Container(height: 0.0,),//height为0,即可隐藏下划线
                    icon: Icon(Icons.arrow_right),// icon: Icon(Icons.arrow_right, color: Colors.blue.withOpacity(0.7), size: 60),
                    iconSize: 30,
                    iconEnabledColor: Colors.amberAccent.withOpacity(0.9),//启用icon颜色
                    hint: Text('请选择悬赏类型',style: TextStyle(color:Colors.white,fontSize: 18),),isExpanded: true,//默认提示文字
                    items: [
                      DropdownMenuItem(child: Row(children: <Widget>[Text('超市购物',style: TextStyle(color: Colors.blue),), SizedBox(width: 18), Icon(Icons.shopping_cart,color: Colors.blue,) ]), value: 1),
                      DropdownMenuItem(child: Row(children: <Widget>[Text('软件安装',style: TextStyle(color: Colors.blue),), SizedBox(width: 18), Icon(Icons.shopping_cart,color: Colors.blue,) ]), value: 2),
                      DropdownMenuItem(child: Row(children: <Widget>[Text('卫生清洁',style: TextStyle(color: Colors.blue),), SizedBox(width: 18), Icon(Icons.shopping_cart,color: Colors.blue,) ]), value: 3),
                    ], onChanged: (value)=>setState(()=>_value=value)),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20,left: 40),
                child: Text("悬赏详情",style: TextStyle(color:Colors.white,fontSize: 18),),
              ),
              Container(
                //color: Colors.white38,
                width: 200,
                margin: EdgeInsets.only(top: 20,left: 80),
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  color: Colors.white12,
                  height: 80,
                  width: 200,
                  alignment: Alignment.center,
                  child: Text("这里是描述",style: TextStyle(color: Colors.white,fontSize: 36),),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20,left: 40),
                child: Text("任务要求",style: TextStyle(color:Colors.white,fontSize: 18),),
              ),
              Container(
                //color: Colors.white38,
                width: 200,
                margin: EdgeInsets.only(top: 20,left: 80),
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  color: Colors.white12,
                  height: 120,
                  width: 200,
                  alignment: Alignment.center,
                  child: Text("这里是要求",style: TextStyle(color: Colors.white,fontSize: 36),),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20,left: 40),
                child: Text("完成时限",style: TextStyle(color:Colors.white,fontSize: 18),),
              ),
              Container(
                //color: Colors.white38,
                width: 200,
                margin: EdgeInsets.only(top: 0,left: 80),
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  color: Colors.white12,
                  height: 40,
                  width: 200,
                  alignment: Alignment.center,
                  child: Text("这里是时间",style: TextStyle(color: Colors.white,)),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20,left: 40),
                child: Text("赏金",style: TextStyle(color:Colors.white,fontSize: 18),),
              ),
              Container(
                //color: Colors.white38,
                width: 240,
                margin: EdgeInsets.only(top: 20,left: 75),
                child: Container(
                  margin: EdgeInsets.only(top: 0,left: 40),
                  color: Colors.white12,
                  height: 40,
                  width: 250,
                  alignment: Alignment.center,
                  child: Text("这里是钱",style: TextStyle(color: Colors.white,),),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: 250,
                margin: EdgeInsets.only(top: 30,left: 110),
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                  child: FlatButton(onPressed: (){
                    myDialog(context);
                  }, child: Container(
                    child: Text("发布",style: TextStyle(color: Colors.white,fontSize: 18),),
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
//提示框
Future<AlertDialog> myDialog(BuildContext context) {
  return showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text('提示'),
          content: new Text('发布成功'),
          actions: <Widget>[
            // OutlineButton(
            //   child: new Text('取消'),
            //   onPressed: () {
            //     Navigator.of(context).pop();
            //   },
            // ),
            OutlineButton(
              child: new Text('好的'),
              onPressed: () async {
                //todo 清除更新登陆状态
                Navigator.push(context,MaterialPageRoute(builder: (context){
                  return myResk_Pub();
                }));
              },
            )
          ],
        );
      });
}

