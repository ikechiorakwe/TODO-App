import 'package:flutter/material.dart';
import 'package:my_to_do/Views/my_todo.dart';

Map<String, Widget Function(BuildContext)> myRoutes = {
  "/": (BuildContext context) => const MyTodoScreen()
};
