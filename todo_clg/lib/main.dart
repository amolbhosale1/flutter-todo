import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clg/controller/authcontrollert.dart';
import 'package:todo_clg/controller/notification.dart';
import 'package:todo_clg/screen/homeScreen.dart';
import 'package:todo_clg/screen/register/logins.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: dotenv.get("APIKEY",fallback: "not"),
    appId:  dotenv.get("APPID",fallback: "not"),
    messagingSenderId:  dotenv.get("MEGSENDERID",fallback: "not"),
    projectId:  dotenv.get("MEGSENDERID",fallback: "not"),
  ));
  NotificationService().init();
  runApp(const MyApp());
}

authController auths = Get.put<authController>(authController());
bool aut = auths.auth;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.system,
      home: aut ? const HomeScreen() : LoginScreen(),
    );
  }
}
