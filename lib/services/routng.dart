import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:my_to_do/globals/globals.dart';

class MyRoute {
  static Future<void> _logRoute(String routeName) async {
    // TODO: Log this route in firestore, so we can keep track of usage.
  }

  static Map<String, Offset> _offset = {
    "begin": Offset(0, 0),
    "end": Offset(0, 0)
  };

  static get _begin =>
      _offset.containsKey("begin") ? _offset["begin"] : Offset(-1.0, 0.0);

  static get _end => _offset.containsKey("end") ? _offset["end"] : Offset.zero;

  static Route create(
      BuildContext context, destPage, Map<String, Offset> offset,
      {int durationInSeconds = 1, maintainState = true}) {
    var duration = Duration(seconds: durationInSeconds);
    _offset = offset;
    // // let's get the media query.
    // gMQ = MediaQuery.of(context);

    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => destPage,
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          Offset begin = _begin;
          Offset end = _end;
          Curve curve = Curves.fastOutSlowIn;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          // return SlideTransition(
          //   position: animation.drive(tween),
          //   child: child,
          // );
          return SizeTransition(
            sizeFactor: secondaryAnimation,
            child: SlideTransition(
              position: animation.drive(tween),
              child: child,
            ),
          );
        },
        transitionDuration: duration,
        maintainState: maintainState);
  }

  static Route createMaterialPageRoute(
      BuildContext context, dynamic destPage, String routeName) {
    return MaterialPageRoute(builder: (context) {
      return FadeInRight(
        child: ZoomIn(
          child: destPage,
        ),
      );
    });
  }

  static Future goto(BuildContext context, page) async {
    var destPage = page;
    return await Navigator.push(context, create(context, destPage, gFromLR));
  }

  static Future root(
      BuildContext context, String newRouteName, dynamic rootRoute) async {
    return await Navigator.pushNamedAndRemoveUntil(context, newRouteName,
        (route) {
      return route == create(context, rootRoute, gFromLR);
    });
  }

  static Widget _switchScreen(dynamic widget) {
    return FadeInRight(
      child: ZoomIn(
        child: widget,
      ),
    );
  }

  static Future asyncNavigatorPushNamed(BuildContext context, String routeName,
      {Object? arguments}) async {
    _logRoute(routeName.toString());
    return await Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static Future asyncNavigatorPushReplacementNamed(
      BuildContext context, String routeName,
      {Object? arguments}) async {
    _logRoute(routeName.toString());
    return await Navigator.pushReplacementNamed(context, routeName,
        arguments: arguments);
  }

  static Future asyncNavigatorPushReplacement(
      BuildContext context, dynamic route) async {
    _logRoute(route.toString());
    return await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => _switchScreen(route)));
  }

  static Future asyncNavigatorPush(BuildContext context, dynamic route) async {
    _logRoute(route.toString());
    return await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => _switchScreen(route)));
  }
}
