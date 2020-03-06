import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:myflutter_app/router/routerHelper.dart';
import 'package:myflutter_app/startPage/mainPage.dart';
import 'package:myflutter_app/startPage/startPage.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Router router = Router();
    Routes.configureRoutes(router);
    applicationRouter.router = router;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: applicationRouter.router.generator,
      home: MaterialApp(
          home:MyMainPage()
      ),
    );
  }
}

class MyMainPage extends StatefulWidget {
  @override
  _MyMainPageState createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  Future<bool> IsfirstBoot()async{
    SharedPreferences shp = await SharedPreferences.getInstance();
    bool data = shp.getBool('firstStart');
    if(data == null) {
      shp.setBool('firstStart', false);
      data = true;
    }
    if(data)
      applicationRouter.router.navigateTo(context, '/startPagePath',replace: true);
    else
      applicationRouter.router.navigateTo(context, '/loginPagePath',replace: true);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    IsfirstBoot();
    return Container();
//    return FutureBuilder(
//      future: IsfirstBoot(),
//      builder:(BuildContext context, AsyncSnapshot<bool> snapshot) {
//        if(snapshot.hasData) {
//          var value = snapshot.data;
//          if(value)
//            return StartPage();
//          else
//            return MainPage();
//        }
//        else{
//          return Container();
//        }
//      }
//    );
  }
}

