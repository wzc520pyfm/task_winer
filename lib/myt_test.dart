import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';//异步依赖包
import 'package:dio/dio.dart';//dio网络请求依赖包
import 'package:http/http.dart' as http;
//import 'dart:convert';

//******************
Future<Album> createAlbum(String title) async{

  Dio dio=Dio();//使用dio默认配置
//请求地址
  //jsonplaceholder.typicode.com/    //127.0.0.1:8888
  dio.options.baseUrl="http://119.45.102.83:8080";//本地网络地址,这个地址每个人不一样,查看自己的本地IPV4地址的方法在文档中
  //连接服务器超时时间(毫秒)
  dio.options.connectTimeout=5000;
  //在2.x版本中是接收数据的最长时限
  dio.options.receiveTimeout=3000;

  final response=await dio.request(//dio请求时是以JSON格式请求
    "/albums",//albums--dio数据响应头
    data: {'title':title},//请求时向后端发送的数据
    options: Options(method: "POST"),//请求方法--post
  );
//final response=await dio.post("/test",data: {"title":title});
  if(response.statusCode==201){//如果请求成功--201状态码应该与后端保持一致
    print(response.data);//打印查看接收到的数据--接收到的数据存储在response.data中
    //返回Album对象--这个对象中有两个属性值id和title
    //new Map<String,dynamic>.from--这样写的目的是保证参数类型正确,即与Album类中的fromJsom工厂方法保持参数类型一致
    return Album.fromJson(new Map<String,dynamic>.from(response.data));
  }else{//如果请求出错
    throw Exception('Failed to create album.');
  }
}
class Album{
  final int id;
  final String title;
  Album({this.id,this.title});
  factory Album.fromJson(Map<String,dynamic> json){//接收一个Map对象,返回Dart对象--因为操作和使用仍然是Dart对象更方便
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}
class My_Test extends StatefulWidget{
  My_Test({Key key}):super(key: key);
  @override
  My_TestState createState()=>My_TestState();
}

class My_TestState extends State<My_Test>{

  final TextEditingController _controller=TextEditingController();//控制器,可用于:
  //TextField预设内容,获取TextField中的输入内容,监听TextField中的内变化
  Future<Album> _futureAlbum;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        title: Text("this is test"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.backup), onPressed: (){
            Navigator.pop(context);
          })
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        //使用三目运算符来构建UI
        //当_futureAlbum无值(请求数据前)和有值(收到后端数据后)时分别构建不同UI
        child: (_futureAlbum==null)
            ?Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(//文本输入框
              controller: _controller,//绑定控制器
              decoration: InputDecoration(hintText: '请输入注册的用户名'),//预设文本内容
            ),
            RaisedButton(//事件按钮
              child: Text('Create Data'),
              onPressed: (){
                setState(() {
                  //执行网络请求--函数定义在头部--createAlbum
                  _futureAlbum=createAlbum(_controller.text);

                });
              },
            ),
          ],
        )
            :FutureBuilder<Album>(//_futureAlbum有值后
          future: _futureAlbum,
          builder: (context,snapshot){
            if(snapshot.hasData){//如果snapshot获取到了数据则返回获取到的数据
              return Text(snapshot.data.title);
            }else if(snapshot.hasError){//如果发生错误
              return Text("${snapshot.error}");
            }
            //这是一个不断转圆圈的动画组件
            return CircularProgressIndicator();//如果在等待
          },
        ),
      ),
    );
  }

}
//*******************










//
//
//
// import 'dart:convert';
//
// Future<Album> createAlbum(String title) async{
//
//   final response=
//   await http.get('http://192.168.43.147:8080');
//   print('statusCode:${response.statusCode}');
// //final response=await dio.post("/test",data: {"title":title});
//   if(response.statusCode==201){//如果请求成功--201状态码应该与后端保持一致
//     print(response.body);//打印查看接收到的数据--接收到的数据存储在response.data中
//     //返回Album对象--这个对象中有两个属性值id和title
//     //new Map<String,dynamic>.from--这样写的目的是保证参数类型正确,即与Album类中的fromJsom工厂方法保持参数类型一致
//     return Album.fromJson(new Map<String,dynamic>.from(json.decode(response.body)));
//   }else{//如果请求出错
//     throw Exception('Failed to create album.');
//   }
// }
// class Album{
//   final int id;
//   final String title;
//   Album({this.id,this.title});
//   factory Album.fromJson(Map<String,dynamic> json){//接收一个Map对象,返回Dart对象--因为操作和使用仍然是Dart对象更方便
//     return Album(
//       id: json['id'],
//       title: json['title'],
//     );
//   }
// }
//
//
// class My_Test extends StatefulWidget{
//   My_Test({Key key}):super(key: key);
//   @override
//   My_TestState createState()=>My_TestState();
// }
//
// class My_TestState extends State<My_Test>{
//
//   final TextEditingController _controller=TextEditingController();//控制器,可用于:
//   //TextField预设内容,获取TextField中的输入内容,监听TextField中的内变化
//   Future<Album> _futureAlbum;
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar:AppBar(
//         title: Text("this is test"),
//         actions: <Widget>[
//           IconButton(icon: Icon(Icons.backup), onPressed: (){
//             Navigator.pop(context);
//           })
//         ],
//       ),
//       body: Container(
//         alignment: Alignment.center,
//         padding: const EdgeInsets.all(8.0),
//         //使用三目运算符来构建UI
//         //当_futureAlbum无值(请求数据前)和有值(收到后端数据后)时分别构建不同UI
//         child: (_futureAlbum==null)
//             ?Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(//文本输入框
//               controller: _controller,//绑定控制器
//               decoration: InputDecoration(hintText: '请输入注册的用户名'),//预设文本内容
//             ),
//             RaisedButton(//事件按钮
//               child: Text('Create Data'),
//               onPressed: (){
//                 setState(() {
//                   //执行网络请求--函数定义在头部--createAlbum
//                   _futureAlbum=createAlbum(_controller.text);
//                 });
//               },
//             ),
//           ],
//         )
//             :FutureBuilder<Album>(//_futureAlbum有值后
//           future: _futureAlbum,
//           builder: (context,snapshot){
//             if(snapshot.hasData){//如果snapshot获取到了数据则返回获取到的数据
//               return Text(snapshot.data.title);
//             }else if(snapshot.hasError){//如果发生错误
//               return Text("${snapshot.error}");
//             }
//             //这是一个不断转圆圈的动画组件
//             return CircularProgressIndicator();//如果在等待
//           },
//         ),
//       ),
//     );
//   }
//
// }