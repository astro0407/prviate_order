import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:private_order/shop_page.dart';
import 'guide_page.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized(); //不加这个强制横/竖屏会报错
  SystemChrome.setPreferredOrientations([
    // 强制竖屏
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runZonedGuarded<Future<Null>>(() async {
    runApp(MyApp());
  }, (e, s) => _reportError(e));
}

///通过接口上报
Future<Null> _reportError(e) async {
  //print(e);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(750, 1624),
      builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Private Order',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              primaryColor: Colors.black,
              buttonColor: Colors.black,
              primaryIconTheme: IconThemeData(color: Colors.black),
              primaryTextTheme: TextTheme(bodyText1: TextStyle(color: Colors.black, fontFamily: "Aveny")),
              textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black))),
          home: GuidePage(),
          builder: EasyLoading.init(),
          supportedLocales: [const Locale('zh')],
          locale: const Locale('zh'),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ]),
    );
  }
}
