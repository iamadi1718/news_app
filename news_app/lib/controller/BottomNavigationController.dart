
import 'package:get/get.dart';
import 'package:news_app/pages/articlepage/ArticlePage.dart';
import 'package:news_app/pages/homepages/HomePage.dart';
import 'package:news_app/pages/profilepage/Profilepage.dart';

class Bottomnavigationcontroller extends GetxController{
  RxInt index=0.obs;
  var pages=[
    Homepage(),
    Articlepage(),
    ProfilePage(),
  ];
  
}