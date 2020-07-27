import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sparabox/screens/login_screen.dart';
import 'package:sparabox/utilities/push_nofitications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PushNotificationsManager().init();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sparabox Login',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
