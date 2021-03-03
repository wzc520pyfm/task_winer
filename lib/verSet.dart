import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//验证码包
import 'package:flutter_verification_box/verification_box.dart';
import 'package:task_winer/setPassw.dart';
//验证码-找回密码
class Verifcation_Set extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
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
              print('$value');
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Set_Password();
              }));
            },
            //除此之外可自定义decoration,
          ),
        ),
      ),
    );
  }
}