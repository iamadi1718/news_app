import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/BottomNavigationController.dart';
class MyNav extends StatelessWidget {
  const MyNav({super.key});

  @override
  Widget build(BuildContext context) {
    Bottomnavigationcontroller controller=Get.put(Bottomnavigationcontroller());
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  width: 200,
  height: 60,
  decoration: BoxDecoration(
    color: Theme.of(context).colorScheme.primaryContainer,
    borderRadius: BorderRadius.circular(100),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      InkWell(
        onTap: (){
          controller.index.value=0;
        },
        child: Obx(
          ()=>Container(
         
            height: 40,
            width: 40,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: controller.index.value==0?Colors.deepOrange:null,
              borderRadius: BorderRadius.circular(10),),
            child: Center(
              child: Icon(Icons.home,
              size: 30,
               color: Colors.white,
               ),
            ),
             ),
        ),
      ), // you can change color
      InkWell(
        onTap: () {
          controller.index.value=1;
        },
        child: Obx(
          ()=>Container(
           
            height: 40,
            width: 40,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: controller.index.value==1?Colors.deepOrange:null,
              borderRadius: BorderRadius.circular(10),),
            child: Center(
              child: Icon(Icons.book,
              size: 30,
               color: Colors.white,
               ),
            ),
             ),
        ),
      ), 
      InkWell(
        onTap: () {
          controller.index.value=2;
        },
        child: Obx(
          ()=> Container(
            
            height: 40,
            width: 40,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: controller.index.value==2?Colors.deepOrange:null,
              borderRadius: BorderRadius.circular(10),
              
              ),
            child: Center(
              child: Icon(Icons.settings,
              size: 30,
               color: Colors.white,
               ),
            ),
             ),
        ),
      ), 
    ],
  ),
),

          ],
        );
  }
}