import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/components/NavigationBar.dart';
import 'package:news_app/controller/BottomNavigationController.dart';
class Homepagecontroller extends StatelessWidget {
  const Homepagecontroller({super.key});

  @override
  Widget build(BuildContext context) {
    Bottomnavigationcontroller controller=Get.put(Bottomnavigationcontroller());
    return Scaffold(
      
      floatingActionButton: MyNav(),
      body: Obx(()=>controller.pages[controller.index.value]),
    );
  }
}