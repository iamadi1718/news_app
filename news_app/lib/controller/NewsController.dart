import 'dart:convert';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/Newsmodel.dart';

class Newscontroller extends GetxController{
  RxList<Article>newslist=<Article>[].obs;
  RxList<Article>newsforyou=<Article>[].obs;
  RxList<Article>newsforyou5=<Article>[].obs;
  RxList<Article>appleforyou=<Article>[].obs;
  RxList<Article>appleforyou5=<Article>[].obs;
  RxList<Article>teslaforyou=<Article>[].obs;
  RxList<Article>teslaforyou5=<Article>[].obs;
  RxList<Article>businessforyou=<Article>[].obs;
  RxList<Article>businessforyou5=<Article>[].obs;
  RxList<Article> searchResults = <Article>[].obs;
  RxBool isSearching = false.obs;
  RxBool hasSearched = false.obs;
  RxBool isTrendingLoading=false.obs;
  RxBool isnewsforyouLoading=false.obs;
  RxBool isappleforyouLoading=false.obs;
  RxBool isBusinessforyouLoading=false.obs;
  RxBool isTeslaforyouLoading=false.obs;


  void onInit() async{
    super.onInit();
    getTrendingnewsforyou();
    getTrendingnews();
    getApplenewsforyou();
    getBusinessnewsforyou();
    getTeslanewsforyou();
    loadDefaultNews();
  }
  Future<void>getTrendingnews() async{
    isTrendingLoading.value=true;
    var baseurl="https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=dc7f1b4c65fc44d28466ebb958da8f20";
    var response=await http.get(Uri.parse(baseurl));
    if(response.statusCode==200){
      var data=jsonDecode(response.body);
      var articles=data["articles"];
      for(var news in articles){
        newslist.add(Article.fromJson(news));

      }
      isTrendingLoading.value=false;
    }
    else{
      print("Exception throws");
    }
  }
  Future<void>getTrendingnewsforyou() async{
    isTrendingLoading.value=true;
    var baseurl="https://newsapi.org/v2/everything?domains=wsj.com&apiKey=dc7f1b4c65fc44d28466ebb958da8f20";
    var response=await http.get(Uri.parse(baseurl));
    if(response.statusCode==200){
      var data=jsonDecode(response.body);
      var articles=data["articles"];
      for(var news in articles){
        newsforyou.add(Article.fromJson(news));

      }
      newsforyou5.value=newsforyou.sublist(0,5).obs;
      isTrendingLoading.value=false;

    }
    else{
      print("Exception throws");
    }
  }
  Future<void>getApplenewsforyou() async{
    isappleforyouLoading.value=true;
    var baseurl="https://newsapi.org/v2/everything?q=apple&from=2025-08-06&to=2025-08-06&sortBy=popularity&apiKey=dc7f1b4c65fc44d28466ebb958da8f20";
    var response=await http.get(Uri.parse(baseurl));
    if(response.statusCode==200){
      var data=jsonDecode(response.body);
      var articles=data["articles"];
      for(var news in articles){
        appleforyou.add(Article.fromJson(news));

      }
      appleforyou5.value=appleforyou.sublist(0,5).obs;
      isappleforyouLoading.value=false;

    }
    else{
      print("Exception throws");
    }
  }
  Future<void>getTeslanewsforyou() async{
    isTeslaforyouLoading.value=true;
    var baseurl="https://newsapi.org/v2/everything?q=tesla&from=2025-07-07&sortBy=publishedAt&apiKey=dc7f1b4c65fc44d28466ebb958da8f20";
    var response=await http.get(Uri.parse(baseurl));
    if(response.statusCode==200){
      var data=jsonDecode(response.body);
      var articles=data["articles"];
      for(var news in articles){
        teslaforyou.add(Article.fromJson(news));

      }
      teslaforyou5.value=teslaforyou.sublist(0,5).obs;
      isTeslaforyouLoading.value=false;

    }
    else{
      print("Exception throws");
    }
  }
  Future<void>getBusinessnewsforyou() async{
    isBusinessforyouLoading.value=true;
    var baseurl="https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=dc7f1b4c65fc44d28466ebb958da8f20";
    var response=await http.get(Uri.parse(baseurl));
    if(response.statusCode==200){
      var data=jsonDecode(response.body);
      var articles=data["articles"];
      for(var news in articles){
        businessforyou.add(Article.fromJson(news));

      }
      businessforyou5.value=businessforyou.sublist(0,15).obs;
      isBusinessforyouLoading.value=false;

    }
    else{
      print("Exception throws");
    }
  }
  Future<void> loadDefaultNews() async {
    isSearching.value = true;
    final url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=dc7f1b4c65fc44d28466ebb958da8f20";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final articles = data["articles"];
        searchResults.assignAll(articles.map<Article>((e) => Article.fromJson(e)).toList());
      }
    } catch (e) {
      print("Error loading default news: $e");
    } finally {
      isSearching.value = false;
    }
  }

  Future<void> searchnews(String query) async {
    isSearching.value = true;
    hasSearched.value = true;
    searchResults.clear();

    final url = "https://newsapi.org/v2/top-headlines?country=us&category=business&q=$query&apiKey=dc7f1b4c65fc44d28466ebb958da8f20";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final articles = data["articles"];
        searchResults.assignAll(articles.map<Article>((e) => Article.fromJson(e)).toList());
      }
    } catch (e) {
      print("Error searching news: $e");
    } finally {
      isSearching.value = false;
    }
  }
  

}