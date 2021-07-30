import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'component/constant/constants.dart';
import 'component/route/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

  const SystemUiOverlayStyle dark = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //systemNavigationBarColor: Colors.blue,
      systemNavigationBarIconBrightness: Brightness.light,
      //systemNavigationBarDividerColor: Colors.blue,
      statusBarIconBrightness: Brightness.dark);
  SystemChrome.setSystemUIOverlayStyle(dark);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final materialApp = MaterialApp(
      title: appName,
      theme: ThemeData(
          brightness: Brightness.light,
          accentColor: Colors.teal,
          primaryColor: Colors.teal,
          primarySwatch: Colors.teal,
          fontFamily: quickFont),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      initialRoute: '/',
      onGenerateRoute: Routers.generateRoute);

  @override
  Widget build(BuildContext context) {
    return materialApp;
  }
}