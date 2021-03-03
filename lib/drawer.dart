import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'myt_test.dart';

//抽屉
class MyDrawer extends StatelessWidget{
  const MyDrawer({
    Key key,
  }):super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Container(
        color: Colors.black,
        child: MediaQuery.removePadding(
            context: context,
            //移除抽屉菜单顶部默认的留白
            removeTop: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 38.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: new CircleAvatar(//圆形区域
                          radius: 30.0,
                          backgroundImage: new NetworkImage('https://goss.veer.com/creative/vcg/veer/800water/veer-308713666.jpg',),
                        ),
                      ),
                      Text(
                        "猎人①号",
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: ListView(
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(Icons.add,color: Colors.white,),
                          title: const Text("Change information",style: TextStyle(color: Colors.white),),
                        ),
                        ListTile(
                          leading: const Icon(Icons.settings,color:Colors.white,),
                          title: const Text("Setting",style: TextStyle(color: Colors.white),),
                        ),
                        ListTile(
                          leading: const Icon(Icons.repeat,color: Colors.white,),
                          title: const Text("Change user",style: TextStyle(color: Colors.white),),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return Login();
                            }));
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.favorite,color: Colors.white,),
                          title: const Text("测试端口",style: TextStyle(color: Colors.white),),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return My_Test();
                            }));
                          },
                        )
                      ],
                    )
                ),
              ],
            )),
      ),
    );
  }
}
