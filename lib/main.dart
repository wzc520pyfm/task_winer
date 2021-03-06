import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homePage.dart';

//布局辅助包
//import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
//页面切换动画待优化
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: '赏金猎人--基于"灵活用工"模式的兼职平台',
      home: HomeBody(),//如果将_HomeBodyState类中Scaffold的内容写在这里,在执行路由时会出错
    );
  }
}
//类型封装体
class Product {
  final String title;
  final String description;
  Product(this.title, this.description);
}