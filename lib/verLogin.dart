import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dio/dio.dart';
//验证码包
import 'package:flutter_verification_box/verification_box.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'login.dart';
import 'reg.dart';

//收到验证码,验证输入的和收到的验证码是否一致

Future<v_Album> v_createAlbum(String user_phone,String user_passw) async{

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
    print('verL接收到的数据:${response.data}');//打印查看接收到的数据--接收到的数据存储在response.data中
    //返回Album对象--这个对象中有两个属性值id和title
    //new Map<String,dynamic>.from--这样写的目的是保证参数类型正确,即与Album类中的fromJsom工厂方法保持参数类型一致
    return v_Album.fromJson(new Map<String,dynamic>.from(response.data));
  }else{//如果请求出错
    throw Exception('Failed to create album.');
  }
}
class v_Album{
  final String user_phone;
  final String user_passw;
  final String user_isscce;//数据存放成功否
  v_Album({this.user_phone,this.user_passw,this.user_isscce});
  factory v_Album.fromJson(Map<String,dynamic> json){//接收一个Map对象,返回Dart对象--因为操作和使用仍然是Dart对象更方便
    return v_Album(
      user_phone: json['user_phone'],
      user_passw: json['user_passw'],
      user_isscce: json['user_isscce'],
    );
  }
}


//验证码-注册
class Verification_Login extends StatefulWidget{
  final Album result;
  Verification_Login({Key key, @required this.result}) : super(key: key);
  //final Album iserInfo;
  //Verification_Login({Key key, @required this.iserInfo}) : super(key: key);
  @override
  _Verifcation_LoginState createState()=> _Verifcation_LoginState();
}
class _Verifcation_LoginState extends State<Verification_Login>{
  //接收上个页面传来的手机号和密码

  //Future<Album> _futureAlbum;
  Future<v_Album> _v_futureAlbum;
  //Map<String,dynamic> _result;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (_v_futureAlbum==null)?Material(
      color: Colors.black,
      child: Center(
        child: Container(
          height: 45,
          child: VerificationBox(
            //验证码个数
            count: 4,
            //边框颜色,宽度,圆角
            borderColor: Colors.lightBlue,
            borderWidth: 3,
            borderRadius: 10,
            //下划线样式
            //type: VerificationBoxItemType.underline,
            //数字样式
            textStyle: TextStyle(color: Colors.lightBlue,fontSize: 24),
            //显示光标,并设置样式
            showCursor: true,
            cursorWidth: 2,
            cursorColor: Colors.red,
            cursorIndent: 10,
            cursorEndIndent: 10,
            //设置光标为整个边框
            focusBorderColor: Colors.lightBlue,
            //验证码输入完成后回调
            onSubmitted: (value){
              print('$value');//1234
              print('wid.result: ${widget.result.user_ver}');
              //申请某个接口发送验证,接收某个接口返回的数据(验证码),与用户输入的验证码进行比对
              //如果一致则执行跳转,否则提示失败清空填写,超时60s则重新申请发送验证码
              if(value.toString()==widget.result.user_ver.toString()){
                //如果验证码正确
                //则注册成功,把手机号和密码存入数据库--向后端发送数据请求--phone和passw
                print('成功');
                setState(() {
                  _v_futureAlbum=v_createAlbum(widget.result.user_phone.toString(),widget.result.user_passw.toString());//执行网络请求
                  //后端收到数据后把数据存入数据库-并返回成功与否
                });


                //并跳转至登录页---交由获得数据后实现
                // Navigator.push(context, MaterialPageRoute(builder: (context){
                //   return Login();
                // }));
              }else{//如果验证码错误
                //问题:如果重构页面?
                //清空
                //超时60s重新申请验证码请求--未实现
                Fluttertoast.showToast(
                    msg: "验证码错误",//String	设置toast展示的字符串
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,//ToastGravity枚举	设置toast的展示位置.(Web端仅支持顶部和底部)
                    timeInSecForIosWeb: 1,//int	ios秒数
                    backgroundColor: Colors.black45,//bgcolor	Color	toast背景色
                    textColor: Colors.white,//Color	toast文字颜色
                    fontSize: 16.0);//	float	toast文字字体大小
                setState(() {

                  //Navigator.pop(context);
                });

              }

            },
            //除此之外可自定义decoration,
          )
        ),
      ),
    ):FutureBuilder<v_Album>(//_futureAlbum有值后
      future: _v_futureAlbum,
      builder: (context,v_snapshot){
        if(v_snapshot.hasData){//如果snapshot获取到了数据则返回获取到的数据
          //将用户手机号,密码和收到的验证码一起保存,
          //_data={"user_phone":"${_data['user_phone']}","user_passw":"${_data['user_passw']}","user_ver":"${snapshot.data}"};
          //转换为统一对象
          //Album _jData= Album.fromJson(_data);
          //如果收到后端数据存入成功的通知
          print('snapshot.data.user.user_isscce: ${v_snapshot.data.user_isscce}');
          if(v_snapshot.data.user_isscce.toString()=="1111"){//如果成功
            return Login();
          }else{
            return Reg();
          }

        }else if(v_snapshot.hasError){//如果发生错误
          return Text("${v_snapshot.error}",style: TextStyle(color: Colors.white70),);
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


//reg  中如果futureAlbum为空,渲染reg,如果不为空,跳转verlogin同时把获取到的数据传过去
//在verlogin中当输入完成后
// 比较值是否正确


