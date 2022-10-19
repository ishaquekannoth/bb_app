import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<bool> isConnectionOk() async {
  final result = await InternetConnectionChecker().hasConnection;
  return result;
}
