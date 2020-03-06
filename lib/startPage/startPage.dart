import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:myflutter_app/router/routerHelper.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return IntroViewsFlutter(
      pageList,
      onTapDoneButton: (){
        applicationRouter.router.navigateTo(context, '/loginPagePath',replace: true);
      },
      showSkipButton: true,
      pageButtonTextStyles: new TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontFamily: "Regular",
      ),
    );
  }
}


final pageIntroduceStr = List.generate(3, (index){
  return '当前引导页面为$index';
});

final colorList = [Colors.red,Colors.blue,Colors.white];

final pageList = List.generate(pageIntroduceStr.length, (index){
  return PageViewModel(
    pageColor: const Color(0xFF607D8B),
    iconColor: null,
    bubbleBackgroundColor: colorList[index],
    body: Text(pageIntroduceStr[index]),
    title: Text('${index}'),
    mainImage: Image.network(urlList[index]),
    titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
  );
});

final urlList = [
  'http://attach.bbs.miui.com/forum/201311/17/174124tp3sa6vvckc25oc8.jpg',
  'http://img.zcool.cn/community/01736f5e204039a80120a8956afe02.jpg@1280w_1l_2o_100sh.jpg',
  'http://pic1.win4000.com/wallpaper/b/55597435bb036.jpg'
];