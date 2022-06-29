import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sliver_appbar_module/screens/choose_screen.dart';
import 'package:flutter_sliver_appbar_module/screens/splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Sliver App Bar';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(
      primaryColor: Colors.black,
    ),
    home: const SplashScreen(),
  );
}

