import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotterymanagement/Colors/Colors.dart';
import 'Router/Route.dart';
import 'Router/RoutePages.dart';
import 'package:url_strategy/url_strategy.dart';
void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: CustomScrollBehavior(),
      defaultTransition: Transition.noTransition,
      transitionDuration: const Duration(seconds: 1),
      debugShowCheckedModeBanner: false,
      title: 'Lottery LTT',
      initialRoute: Routes.LOGIN,
      getPages: RoutePages.listPages,
      theme: ThemeData(scaffoldBackgroundColor: colorwhite),
    );
  }
}
class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
