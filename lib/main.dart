import 'package:flutter/material.dart';
import 'package:my_anim/screens/permission_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/splash_screen.dart';
import 'screens/language_screen.dart';
import 'screens/onboarding1.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs=await SharedPreferences.getInstance();
  final onboarding1=prefs.getBool("onboarding1")?? false;
  runApp(MyApp(onboarding1: onboarding1,));
}

class MyApp extends StatelessWidget {
  final bool onboarding1;
  const MyApp({super.key, this.onboarding1=false});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rub Bank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        '/language': (context) => onboarding1 ?  PermissionScreen() : const LanguageScreen(),
      },
    );
  }
}
