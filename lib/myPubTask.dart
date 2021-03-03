import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'myPubedTask.dart';

//我发布的悬赏
class MyPub_task extends StatefulWidget{
  @override
  _Mypub_taskState createState()=>new _Mypub_taskState();

}
class _Mypub_taskState extends State<MyPub_task>{
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
                child: Text("我发布的悬赏",style: TextStyle(color: Colors.white,fontSize: 24),),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: 450,
                height: 700,
                margin: EdgeInsets.only(top: 20,left: 15),
                child: SizedBox.expand(//expand让box充满父容器
                  //width: 300,
                  //height: 750.0,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical, //排列方向 垂直和水平
                      itemCount: 20, //列表项个数
                      itemExtent: 112.0,//确定每个item的高度，会让item加载更加高效 可以提高性能
//          physics滑动类型设置
//      AlwaysScrollableScrollPhysics()总是可以滑动
                      physics: AlwaysScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text("悬赏任务 $index      (正在执行)",style: TextStyle(color: Colors.white),),
                          leading: Icon(Icons.favorite_border,color: Colors.white,), //前置图标
                          subtitle: Text("酬金:500  难度:4  时限:3天",style: TextStyle(color: Colors.white),), //子标题
                          trailing: Icon(Icons.more_vert,color: Colors.white,), //后置图标
                          isThreeLine: true, //是否显示三行
                          contentPadding: EdgeInsets.all(20.0), //内边距
                          enabled: true, //是否禁用
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return myResk_Pub();
                            }));
                          },
                          onLongPress: () {
                            print('长按了：$index');
                          },
                          selected: false,
                        );
                      }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
