import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dio/dio.dart';

import 'package:task_winer/reg.dart';
import 'package:task_winer/resetPassw.dart';
import 'homePage.dart';

//获得输入框的值
// 将值发送至后端---后端与数据库内已存在的用户对比,如果正确则返回来一个正值
//如果后端返回正值,则密码正确进入主页面,否则提示密码错误

Future<l_Album> createAlbum(String user_phone,String user_passw) async{

  Dio dio=Dio();//使用dio默认配置
//请求地址
  dio.options.baseUrl="http://119.45.102.83:8080";//本地网络地址,这个地址每个人不一样,查看自己的本地IPV4地址的方法在文档中
  //连接服务器超时时间(毫秒)
  dio.options.connectTimeout=5000;
  //在2.x版本中是接收数据的最长时限
  dio.options.receiveTimeout=3000;

  final response=await dio.request(//dio请求时是以JSON格式请求
    "/albums",//albums--dio数据响应头
    data: {'user_phone':user_phone,'user_passw':user_passw},//请求时向后端发送的数据
    options: Options(method: "POST"),//请求方法--post
  );
  if(response.statusCode==201){//如果请求成功--201状态码应该与后端保持一致
    print(response.data);//打印查看接收到的数据--接收到的数据存储在response.data中
    //返回Album对象--这个对象中有两个属性值id和title
    //new Map<String,dynamic>.from--这样写的目的是保证参数类型正确,即与Album类中的fromJsom工厂方法保持参数类型一致
    return l_Album.fromJson(new Map<String,dynamic>.from(response.data));
  }else{//如果请求出错
    throw Exception('Failed to create album.');
  }
}
//获取user_name和user_passw
class l_Album{
  final String user_phone;
  final String user_passw;
  final String user_isbool;//密码是否正确
  l_Album({this.user_phone,this.user_passw,this.user_isbool});
  factory l_Album.fromJson(Map<String,dynamic> json){//接收一个Map对象,返回Dart对象--因为操作和使用仍然是Dart对象更方便
    return l_Album(
      user_phone: json['user_phone'],
      user_passw: json['user_passw'],
      user_isbool:json['user_isbool'],
    );
  }
}




//登录
class Login extends StatefulWidget{

  @override
  _LoginState createState()=>_LoginState();
}

class _LoginState extends State<Login>{

  final TextEditingController _controller1=TextEditingController();//控制器
  final TextEditingController _controller2=TextEditingController();//控制器

  Future<l_Album> _l_futureAlbum;

  @override
  Widget build(BuildContext context) {
    return (_l_futureAlbum==null)?Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 15.0),
              child:Text("登录或注册账号",style: TextStyle(color: Colors.white,fontSize: 24),),
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
                          controller: _controller1,
                            style: TextStyle(fontSize: 18,color: Colors.white),
                            decoration: const InputDecoration(
                              hintText: '帐号/邮箱',
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
            ),
            Container(
              margin: EdgeInsets.only(top: 10,bottom: 5,left: 40,right: 40),
              padding: EdgeInsets.all(5.0),
              child: Material(//新建子部件实现圆角,也可切割实现,共三种方法
                borderRadius: BorderRadius.circular(50.0),
                elevation: 5.0,
                color: Colors.black,
                child: Row(
                  children: <Widget>[
                    Expanded(//TextField必须在Expanded内,或者Widget buildTextField内
                      child: Theme(//改变输入框边框颜色必须在Theme内
                        data: new ThemeData(primaryColor: Colors.red, hintColor: Colors.white38),//改变输入框边框颜色
                        child: new TextField(
                            controller: _controller2,
                            style: TextStyle(fontSize: 18,color: Colors.white),
                            decoration: const InputDecoration(
                              hintText: '密码',
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


                      setState(() {
                        _l_futureAlbum=createAlbum(_controller1.text, _controller2.text);
                      });

                      // Navigator.push(context, MaterialPageRoute(builder: (context){
                      //   return HomeBody();
                      // }));
                    }, child: Container(
                      width: 358,
                      height: 50,
                      alignment: Alignment.center,
                      color: Color(0x000071fe),
                      child: Text("登录",style: TextStyle(color: Color(0x66ffffff),fontSize: 18,),),
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
                child: Row(
                  children: <Widget>[
                    Container(
                      child: FlatButton(onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context){
                          return Reset_PassWord();
                        }));
                      }, child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text("忘记密码",style: TextStyle(color: Colors.white70),),
                      ),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 220),
                      child: FlatButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Reg();
                        }),);
                      }, child: Container(
                        alignment: Alignment.centerRight,
                        child: Text("用户注册",style: TextStyle(color: Colors.white70),),
                      ),),
                    ),
                  ],
                ),
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
    ):FutureBuilder<l_Album>(//_futureAlbum有值后
      future: _l_futureAlbum,
      builder: (context,snapshot){
        if(snapshot.hasData){//如果snapshot获取到了数据则返回获取到的数据
          //将用户手机号,密码和收到的验证码一起保存,
          //_data={"user_phone":"${_data['user_phone']}","user_passw":"${_data['user_passw']}","user_ver":"${snapshot.data}"};
          //转换为统一对象
          //Album _jData= Album.fromJson(_data);

          //跳转页面同时传值--收到服务器响应正确时
          if(snapshot.data.user_isbool.toString()=="1111"){
            return HomeBody();
          }
          return Login();
        }else if(snapshot.hasError){//如果发生错误
          return Text("${snapshot.error}",style: TextStyle(color: Colors.white70),);
        }
        //这是一个不断转圆圈的动画组件
        return Center(

          child: Container(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(),//如果在等待,,
          ),
        );
      },
    );
  }
}