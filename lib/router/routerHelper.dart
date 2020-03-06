import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:myflutter_app/startPage/mainPage.dart';
import 'package:myflutter_app/startPage/startPage.dart';
import 'package:myflutter_app/startPage/loginPage.dart';
Handler mainPage = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> parameters){
    return MainPage();
  }
);

Handler loginPage = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters){
      return LoginPage();
    }
);

Handler startPage = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters){
      return StartPage();
    }
);

class Routes{
  static String root = '/';
  static String mainPagePath = '/mainPagePath';
  static String loginPagePath = '/loginPagePath';
  static String startPagePath = '/startPagePath';
  static void configureRoutes(Router router){
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> parameters){
        print('导航失败');
        return MainPage();
      }
    );
    router.define(loginPagePath, handler: loginPage);
    router.define(mainPagePath, handler: mainPage);
    router.define(startPagePath, handler: startPage);
  }
}

class applicationRouter{
  static Router router;
}