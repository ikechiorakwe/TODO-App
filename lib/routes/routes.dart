import 'package:flutter/material.dart';
import 'package:my_to_do/Views/my_todo.dart';
import 'package:my_to_do/Views/sign_in.dart';

Map<String, Widget Function(BuildContext)> myRoutes = {
  "/": (BuildContext context) => MySignInPage(),
};
