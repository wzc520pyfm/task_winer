import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_winer/taskDoing.dart';
import 'homePage.dart';
import 'myPubTask.dart';

//收藏的悬赏
class Like_Rask extends StatelessWidget{
  Like_Rask({
    Key key,
    @required this.text,//接收一个text参数
  }): super(key:key);
  final String text;
  String str;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(
        backgroundColor: Colors.black,
        leading: Builder(builder: (BuildContext context){
          return new IconButton(icon: new Icon(Icons.arrow_back_ios), onPressed: (){//注意不能直接在MaterialApp下使用 Navigator,需要在路由外嵌套一层即可正常使用,如上述类的调用
            Navigator.pop(context,"返回值");
          });
        }),
        //title: new Text('猎人①号'),
        actions: <Widget>[
          Container(
            width: 210,
            alignment: Alignment.center,
            height: 50.0,
            child: Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.amber,
              child: Row(
                children: <Widget>[
                  FlatButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return MyPub_task();
                    }));
                  }, child: Row(
                    children: <Widget>[
                      Text("我发布的悬赏",style: TextStyle(fontSize: 20,color: Colors.purple),),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        alignment: Alignment.center,
                        child: Icon(Icons.send,color: Colors.white,size: 25,),
                      ),
                    ],
                  ))

                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(//悬赏榜
              padding: EdgeInsets.only(top: 15.0),
              alignment: Alignment.center,
              height: 80.0,
              child: Text("我收藏的悬赏",style: TextStyle(fontSize: 24,color: Colors.white),),
            ),
            SizedBox(
              height: 685.0,
              child: ListView.builder(
                  scrollDirection: Axis.vertical, //排列方向 垂直和水平
                  itemCount: 20, //列表项个数
                  itemExtent: 112.0,//确定每个item的高度，会让item加载更加高效 可以提高性能
//          physics滑动类型设置
//      AlwaysScrollableScrollPhysics()总是可以滑动
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text("悬赏任务 $index      (待完成)",style: TextStyle(color: Colors.white),),
                      leading: Icon(Icons.favorite_border,color: Colors.white,), //前置图标
                      subtitle: Text("酬金:500  难度:4  时限:3天",style: TextStyle(color: Colors.white),), //子标题
                      trailing: Icon(Icons.more_vert,color: Colors.white,), //后置图标
                      isThreeLine: true, //是否显示三行
                      contentPadding: EdgeInsets.all(20.0), //内边距
                      enabled: true, //是否禁用
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Resk_doing();
                        }));
                      },
                      onLongPress: () {
                        print('长按了：$index');
                      },
                      selected: false,
                    );
                  }),
            ),
          ],
        ),

      ),
      floatingActionButton: Container(
        height: 65,
        width: 65,
        //color: Colors.white,
        padding: EdgeInsets.all(3.0),
        child: FloatingActionButton(//悬浮在右下角的floatingActionButton按钮
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return HomeBody();
            }));
          },
          tooltip: 'what?你按啥子?',//长按提示
          backgroundColor: Colors.amberAccent,
          child: Icon(Icons.home,size: 30,),
        ),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
