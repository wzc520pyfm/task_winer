import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:task_winer/releaseTask.dart';
import 'package:task_winer/taskInfor.dart';
import 'main.dart';
import 'drawer.dart';
import 'myPage.dart';
import 'releasedTask.dart';
//主页面--page1
class HomeBody extends StatefulWidget{//有状态的组件
  //HomeBody({Key key,this.id}):super(key:key);//--测试-李
  //String id;//--测试-李
  @override
  _HomeBodyState createState()=> _HomeBodyState();//上述代码简写
}
class _HomeBodyState extends State<HomeBody>{

  

  int _currenIndex=0;
  List<Widget> _pageList=[
    releasedTask(),
    homePage(),
    TipRoute(),
  ];
  List<BottomNavigationBarItem> _barItem=[
    BottomNavigationBarItem(icon: Icon(Icons.grade),title: Text('已接悬赏')),
    BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('悬赏大厅')),
    BottomNavigationBarItem(icon: Icon(Icons.person),title: Text('我的')),
  ];
  int _currentIndex=1;
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'',
      theme: ThemeData(
        //primarySwatch:Colors.black,
      ),
      home: Scaffold(
        body: this._pageList[this._currentIndex],
        //底部导航栏
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index){
            //print("$widget.id");//--测试-李
            setState(() {
              this._currentIndex=index;
              this._currenIndex=index;
            });
          },

          currentIndex: this._currentIndex,
          items: _barItem,
          iconSize: 30,
          backgroundColor: Color(0xf1232326),
          fixedColor: Colors.blue,//选中颜色
          unselectedItemColor: Colors.white70,//未选中颜色
          selectedFontSize: 16,
          unselectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
        ),
        // floatingActionButton: Container(
        //   height: this._currenIndex==1?80:65,
        //   width: this._currenIndex==1?80:65,
        //   //color: Colors.white,
        //   padding: EdgeInsets.all(3.0),
        //   child: FloatingActionButton(//悬浮在右下角的floatingActionButton按钮
        //     onPressed: (){
        //       setState(() {
        //         this._currentIndex=1;
        //         this._currenIndex=1;
        //       });
        //     },
        //     tooltip: 'what?你按啥子?',//长按提示
        //     backgroundColor: Colors.amberAccent,
        //     child: Icon(Icons.home,size: this._currenIndex==1?40:30,),
        //   ),
        // ),
        // //改变右下角悬浮按钮位置---居中
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),

    );
  }
}
class homePage extends StatefulWidget{
  @override
  _homePageState createState()=>_homePageState();
}
class _homePageState extends State<homePage>{

  int _fagval=0;
  var _value;
  List<Product> litems = [Product("超市购物", "酬金:500  难度:4  时限:3天"),
    Product("软件安装", "酬金:200  难度:3  时限:3天"),
    Product("卫生清洁", "酬金:100  难度:2  时限:1天"),
    Product("超市购物", "酬金:500  难度:4  时限:3天"),
    Product("软件安装", "酬金:400  难度:1  时限:2天"),
    Product("软件安装", "酬金:300  难度:4  时限:3天"),
    Product("超市购物", "酬金:400  难度:5  时限:5天"),
    Product("卫生清洁", "酬金:100  难度:4  时限:3天"),
    Product("卫生清洁", "酬金:500  难度:2  时限:4天"),];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(
        backgroundColor: Colors.black,
        leading: Builder(builder: (BuildContext context){
          return new IconButton(icon: new Container(
            padding: EdgeInsets.all(1.0),
            child: new CircleAvatar(//圆形区域
              radius: 30.0,
              backgroundImage: new NetworkImage('https://goss.veer.com/creative/vcg/veer/800water/veer-308713666.jpg',),
            ),
          ), onPressed: (){//注意不能直接在MaterialApp下使用 Navigator,需要在路由外嵌套一层即可正常使用,如上述类的调用
            Scaffold.of(context).openDrawer();//点击时打开抽屉
          });
        }),
        title: new Text('猎人①号'),
        actions: <Widget>[
          Container(
            height: 12.0,
            width: 300.0,
            //color: Color(0xff44444f),
            padding: EdgeInsets.only(left: 20, right: 5, top: 5, bottom: 5),
            child: Row(
              children: <Widget>[
                Expanded(//TextField必须在Expanded内,或者Widget buildTextField内
                  child: Theme(//改变输入框边框颜色必须在Theme内
                    data: new ThemeData(primaryColor: Colors.red, hintColor: Colors.white38),//改变输入框边框颜色
                    child: new TextField(
                        style: TextStyle(fontSize: 18,color: Colors.white),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search,color: Colors.white70,),
                          hintText: '搜索',
                          //圆角输入框
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50),),
                            //borderSide:BorderSide(color: Colors.pink,width: 3.0,style: BorderStyle.solid),
                          ),
                          //内容边距
                          contentPadding: const EdgeInsets.all(15.0),
                        ),
                        // 当 value 改变的时候，触发
                        onChanged: (val) {
                          print(val);
                        }
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer:new MyDrawer(),//抽屉
      body: Container(
        child: Column(
          children: <Widget>[
            Container(//悬赏榜
              padding: EdgeInsets.only(top: 15.0),
              alignment: Alignment.center,
              height: 80.0,
              child: Text("悬赏榜",style: TextStyle(fontSize: 24,color: Colors.white),),
            ),
            //发布悬赏与分类
            Row(
              children: <Widget>[
                //功能-发布悬赏
                Container(
                  height: 50,
                  margin: EdgeInsets.only(left: 20),
                  child: Material(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                    child: FlatButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Release_Resk();
                      }));
                    }, child: Container(
                      width: 150,
                      //color: Colors.amber,
                      margin: EdgeInsets.only(left: 0.0),
                      padding: EdgeInsets.only(top:10.0,bottom: 10.0,left: 10.0,right: 10.0),
                      alignment: Alignment.center,
                      height: 50.0,
                      child: Text("发布悬赏",style: TextStyle(fontSize: 20,color: Colors.purple),),
                    ),),
                  ),
                ),
                Container(//右侧外框
                  width: 180,
                  margin: EdgeInsets.only(left: 80.0),
                  alignment: Alignment.centerLeft,
                  height: 50.0,
                  //功能-分类
                  child: Material(
                    color: Color(0xff44444f),
                    borderRadius: BorderRadius.circular(10),
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
                        ], onChanged: (value)=>setState((){
                      _value=value;
                      _fagval=value;
                    })),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 560.0,
              child: ListView.builder(
                  scrollDirection: Axis.vertical, //排列方向 垂直和水平
                  itemCount: litems.length, //列表项个数
                  itemExtent: 112.0,//确定每个item的高度，会让item加载更加高效 可以提高性能
//          physics滑动类型设置
//      AlwaysScrollableScrollPhysics()总是可以滑动
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {

                    return SwipeActionCell(
                      backgroundColor: Colors.black,//整个列表背景色
                      key: ObjectKey(litems[index]),///this key is necessary
                      performsFirstActionWithFullSwipe: true,
                      trailingActions: <SwipeAction>[//拉动菜单
                        SwipeAction(
                            title: "不喜欢",
                            onTap: (CompletionHandler handler) async {
                              //设为false,则是此项不消失
                              await handler(false);
                              //延迟函数--1s
                              await Future.delayed(Duration(seconds: 1));
                              //_remove(index, handler);可自定义函数来包装下面的两条语句
                              litems.removeAt(index);//删除当前项
                              setState(() {});//刷新页面
                            },
                            color: Colors.red),
                        SwipeAction(
                            widthSpace: 120,
                            title: "收藏",
                            onTap: (CompletionHandler handler) async{
                              handler(false);
                              setState(() {
                                _fagval=1;
                                //widget.createState();
                              });
                              myDialog(context);
                            },
                            color: Colors.orange
                        ),
                      ],
                      child: ListTile(//列表内容
                        title: Text("${litems[index].title}",style: TextStyle(color: Colors.white),),
                        leading: Icon(Icons.favorite_border,color: Colors.white,), //前置图标
                        subtitle: Text("${litems[index].description}",style: TextStyle(color: Colors.white),), //子标题
                        trailing: Icon(Icons.arrow_forward,color: Colors.white,), //后置图标
                        isThreeLine: true, //是否显示三行
                        contentPadding: EdgeInsets.all(20.0), //内边距
                        enabled: true, //是否禁用
                        onTap: () {
                          print('点击了：$index');
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return Task_Infor();
                          }));
                        },
                        onLongPress: () {
                          print('长按了：$index');
                        },
                        selected: false,
                      ),
                    );
                  }),
            ),
          ],
        ),

      ),

    );
  }
}

//提示框
Future<AlertDialog> myDialog(BuildContext context) {
  return showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text("收藏成功"),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('好的'),
              isDestructiveAction: true,
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
}

