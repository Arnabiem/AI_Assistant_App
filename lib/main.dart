import 'package:ai_assistant/api/appwrite.dart';
import 'package:ai_assistant/constraints/constants.dart';
import 'package:ai_assistant/constraints/pref.dart';
import 'package:ai_assistant/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();  
  // for initializing hive
  pref.initialize();
  // appwrite initialization
  AppWrite.init();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  
  runApp(const MyApp());
}
 class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  @override
  Widget build(BuildContext context) {    
    return GetMaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      themeMode: pref.defaultTheme,
      // dark
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(      
        elevation: 1,
        centerTitle: true,
      titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500),
      )),
      // light
      theme: ThemeData(appBarTheme: const AppBarTheme(
        elevation: 1,
        centerTitle: true,
      titleTextStyle: TextStyle(color: Colors.blue,
      fontSize: 20,
      fontWeight: FontWeight.w500),
      )),
      home:SplashScreen(),
    );
  }
}
extension AppTheme on ThemeData {
  //light text color
  Color get lightTextColor =>
      brightness == Brightness.dark ? Colors.white70 : Colors.black54;

  //button color
  Color get buttonColor =>
      brightness == Brightness.dark ? Colors.cyan.withOpacity(.5) : Colors.blue;
}