import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Animations/Shimmer.dart';
import 'package:news_app/NewsTile.dart';
import 'package:news_app/controller/NewsController.dart';
import 'package:news_app/pages/articlepage/widgets/SearchWidget.dart';

class Articlepage extends StatelessWidget {
  const Articlepage({super.key});

  @override
  Widget build(BuildContext context) {
    final Newscontroller newsController = Get.put(Newscontroller());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              const Searchwidget(),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Search Results',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Powered by NewsAPI',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              const SizedBox(height: 20),

             Obx(() {
  if (newsController.isSearching.value) {
    return Column(
      children: List.generate(5, (_) => const ShimmerTile()),
    );
  }

  // If user has searched and no results
  if (newsController.hasSearched.value && newsController.searchResults.isEmpty) {
    return const Center(child: Text("No news found"));
  }

  // If there are results (either default or from search)
  return Column(
    children: newsController.searchResults.map((article) {
      return Newstile(
        imageurl: article.urlToImage ?? '',
        title: article.title ?? 'No title',
        time: article.publishedAt ?? 'No time',
        author: article.author ?? 'Unknown',
      );
    }).toList(),
  );
})

            ],
          ),
        ),
      ),
    );
  }
}
