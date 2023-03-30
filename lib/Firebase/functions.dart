import 'package:cloud_functions/cloud_functions.dart';

class MyCloudFunction {
  MyCloudFunction();

  final functions = FirebaseFunctions.instance;

  Future<HttpsCallableResult> call(
      String fnName, Map<String, dynamic> payload) async {
    HttpsCallableResult result =
        await FirebaseFunctions.instance.httpsCallable(fnName).call(payload);
    return result.data;
  }
}
