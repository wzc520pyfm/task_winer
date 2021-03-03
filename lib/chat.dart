import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//与客户联系
class Chat extends StatefulWidget{
  @override
  _ChatState createState()=>_ChatState();
}
class _ChatState extends State<Chat>{
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
                margin: EdgeInsets.only(top: 30,),
                child: IconButton(onPressed: (){
                  Navigator.pop(context,"返回值");
                },icon: Icon(Icons.arrow_back_ios,color: Colors.white,),),
              ),
              Container(
                margin: EdgeInsets.only(left: 150,top: 30),
                child: Text("lalala",style: TextStyle(color: Colors.white,fontSize: 24),),
              ),
              Container(
                margin: EdgeInsets.only(left: 110,top: 30),
                child: IconButton(onPressed: (){},icon: Icon(Icons.person,color: Colors.white70,size: 32,),),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: IconButton(icon: Icon(Icons.phone,color: Colors.white70,size: 32,), onPressed: (){}),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
