import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myflutter_app/router/routerHelper.dart';
class LoginPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.yellow, Colors.blue]),
        ),
        child: Center(
          child: Card(
              color: Colors.green,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              elevation: 3,
              margin: EdgeInsets.only(top: 150,left: 60,right: 60,bottom: 200),
              child: Container(width:500,child:LoginCard())
          ),
        ),
      ),
    );
  }
}

class LoginCard extends StatefulWidget {
  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  var nameTextFile = TextEditingController();
  var keyTextFile = TextEditingController();
  bool textIsShow = true;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 50),
          child: Hero(
              tag: 'USER Icon',
              child:Icon(Icons.account_box,size: 100,)
          ),
        ),
        Container(
          width: 250,
          height: 60,
          margin: EdgeInsets.only(top: 30),
          child: TextField(
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter(RegExp("[a-zA-Z]|[0-9]")),
              LengthLimitingTextInputFormatter(8)
            ],
            controller: nameTextFile,
            decoration: InputDecoration(
              icon: Icon(Icons.account_box),
              hintText: "USER NAME",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
            ),
          ),
        ),
        Container(
          width: 250,
          height: 60,
          margin: EdgeInsets.only(top: 30),
          child: TextField(
            controller: keyTextFile,
            obscureText: textIsShow,
            decoration: InputDecoration(
                icon: Icon(Icons.vpn_key),
                hintText: "USER KEY",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                suffixIcon: IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  onPressed: (){
                    setState(() {
                      textIsShow = !textIsShow;
                    });
                  },
                )
            ),
          ),
        ),
        Container(
          width: 130,
          height: 40,
          margin: EdgeInsets.only(top: 50),
          child: FlatButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            onPressed: (){
              applicationRouter.router.navigateTo(context, "/mainPagePath", replace: true);
            },
            color: Colors.black12,
            child: Text('LOGIN',style: TextStyle(fontSize: 30,),),
          ),
        )
      ],
    );
  }
}


