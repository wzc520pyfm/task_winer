import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_winer/verSet.dart';
import 'homePage.dart';

//忘记密码
class Reset_PassWord extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: ()=>Navigator.pop(context,"返回值")),
                ),
                Container(
                  alignment: Alignment.center,
                  //margin: EdgeInsets.only(bottom: 15.0),
                  child:Text("找回密码",style: TextStyle(color: Colors.white,fontSize: 24),),
                ),
              ],
            ),
            Container(
              //width: 100,
              height: 100,
              child: Image.network("https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png",fit: BoxFit.fill,),
            ),
            Container(
              margin: EdgeInsets.only(top: 20,bottom: 5,left: 40,right: 40),
              padding: EdgeInsets.all(5.0),
              child: Material(//新建子部件实现圆角,也可切割实现,共三种方法
                borderRadius: BorderRadius.circular(50.0),
                //shadowColor: Colors.red,//未知
                elevation: 5.0,
                color: Colors.black,
                child: Row(
                  children: <Widget>[
                    Expanded(//TextField必须在Expanded内,或者Widget buildTextField内
                      child: Theme(//改变输入框边框颜色必须在Theme内
                        data: new ThemeData(primaryColor: Colors.red, hintColor: Colors.white38),//改变输入框边框颜色
                        child: new TextField(
                            style: TextStyle(fontSize: 18,color: Colors.white),
                            decoration: const InputDecoration(
                              hintText: '手机号',
                              //圆角输入框
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(50),),
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
            ),
            Container(
              margin: EdgeInsets.only(top: 20,bottom: 5,left: 40,right: 40),
              padding: EdgeInsets.all(5.0),
              child: Material(//新建子部件实现圆角,也可切割实现,共三种方法
                borderRadius: BorderRadius.circular(50.0),
                //shadowColor: Colors.red,//未知
                elevation: 5.0,
                color: Color(0xff0071fe),
                child: Row(
                  children: <Widget>[
                    FlatButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Verifcation_Set();
                      }));
                    }, child: Container(
                      width: 358,
                      height: 50,
                      alignment: Alignment.center,
                      color: Color(0x000071fe),
                      child: Text("验证",style: TextStyle(color: Color(0x66ffffff),fontSize: 18,),),
                    )),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5,bottom: 5,left: 40,right: 40),
              padding: EdgeInsets.all(1.0),
              child: Material(//新建子部件实现圆角,也可切割实现,共三种方法
                color: Color(0x000071fe),
              ),
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
    );
  }
}