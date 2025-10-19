import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
// Import this if using FlutterFire CLI setup
// import 'firebase_options.dart';

import 'package:news_app/controller/BottomNavigationController.dart';
import 'package:news_app/controller/HomepageController.dart';
import 'package:news_app/controller/ThemeController.dart';
import 'package:news_app/pages/homepages/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Basic initialization; for CLI setup, use:
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeController themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Homepagecontroller(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeController.isDarkMode.value
          ? ThemeMode.dark
          : ThemeMode.light,
    );
  }
}
