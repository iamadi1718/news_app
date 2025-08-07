import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Animations/Shimmer.dart';
import 'package:news_app/NewsTile.dart';
import 'package:news_app/TrendingCard.dart';
import 'package:news_app/controller/NewsController.dart';
import 'package:news_app/pages/newsdetails/NewsDetails.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    Newscontroller newsController = Get.put(Newscontroller());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Padding(
            padding: EdgeInsets.all(8.7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _circularIcon(Icons.dashboard),
                    const Text(
                      'NEWSAPP',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5,
                      ),
                    ),
                    _circularIcon(Icons.person),
                  ],
                ),
                const SizedBox(height: 24),
            
                // Hottest News Section
                _sectionHeader('🔥 Hottest News'),
                const SizedBox(height: 12),
                Obx(() => newsController.isTrendingLoading.value
                    ? SizedBox(
                        height: 350,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) => ShimmerCard(),
                        ),
                      )
                    : SizedBox(
                        height: 350,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: newsController.newslist.length,
                          itemBuilder: (context, index) {
                            final item = newsController.newslist[index];
                            return Trendingcard(
                              imageUrl: item.urlToImage!,
                              tag: "Trending #${index + 1}",
                              time: item.publishedAt!.toString(),
                              title: item.title!,
                              author: item.author ?? "Unknown",
                              ontap: () {
                                Get.to(Newsdetails(
                                  imageUrl: item.urlToImage!,
                                  title: item.title!,
                                  author: item.author ?? "Unknown",
                                  time: item.publishedAt.toString(),
                                  content: item.content ?? "No content available",
                                ));
                              },
                            );
                          },
                        ),
                      )),
                const SizedBox(height: 24),
            
                // News for you Section
                _sectionHeader('📰 News for You'),
                const SizedBox(height: 12),
                Obx(() => newsController.isnewsforyouLoading.value
                    ? Column(
                        children:
                            List.generate(5, (index) => const ShimmerTile()),
                      )
                    : Column(
                        children: newsController.newsforyou5.map((item) {
                          return Newstile(
                            imageurl: item.urlToImage!,
                            title: item.title!,
                            time: item.publishedAt!,
                            author: item.author ?? "Unknown",
                          );
                        }).toList(),
                      )),
                const SizedBox(height: 24),
            
                // Apple News
                _sectionHeader('🍎 Apple News'),
                const SizedBox(height: 12),
                Obx(() => newsController.isappleforyouLoading.value
                    ? SizedBox(
                        height: 350,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) => ShimmerCard(),
                        ),
                      )
                    : SizedBox(
                        height: 350,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: newsController.appleforyou5.length,
                          itemBuilder: (context, index) {
                            final item = newsController.appleforyou5[index];
                            return Trendingcard(
                              imageUrl: item.urlToImage!,
                              tag: "Apple #${index + 1}",
                              time: item.publishedAt!.toString(),
                              title: item.title!,
                              author: item.author ?? "Unknown",
                              ontap: () {
                                Get.to(Newsdetails(
                                  imageUrl: item.urlToImage!,
                                  title: item.title!,
                                  author: item.author ?? "Unknown",
                                  time: item.publishedAt.toString(),
                                  content: item.content ?? "No content available",
                                ));
                              },
                            );
                          },
                        ),
                      )),
                const SizedBox(height: 24),
            
                // Tesla News
                _sectionHeader('🚗 Tesla News'),
                const SizedBox(height: 12),
                Obx(() => newsController.isTeslaforyouLoading.value
                    ? Column(
                        children:
                            List.generate(5, (index) => const ShimmerTile()),
                      )
                    : Column(
                        children: newsController.teslaforyou5.map((item) {
                          return Newstile(
                            imageurl: item.urlToImage!,
                            title: item.title!,
                            time: item.publishedAt!,
                            author: item.author ?? "Unknown",
                          );
                        }).toList(),
                      )),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper widget for section headers
  Widget _sectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Text(
          'See all',
          style: TextStyle(
            fontSize: 14,
            color: Colors.blue.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  // Helper widget for circular icon container
  Widget _circularIcon(IconData icon) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 6,
            offset: const Offset(2, 2),
          )
        ],
      ),
      child: Icon(icon, size: 24, color: Colors.black87),
    );
  }
}
