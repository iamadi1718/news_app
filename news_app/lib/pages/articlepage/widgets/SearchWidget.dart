import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/NewsController.dart';

class Searchwidget extends StatelessWidget {
  const Searchwidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Newscontroller newsController = Get.find();
    final TextEditingController searchcontroller = TextEditingController();

    return TextField(
      controller: searchcontroller,
      decoration: InputDecoration(
        hintText: 'Search for business news...',
        suffixIcon: InkWell(
          onTap: () {
            final query = searchcontroller.text.trim();
            if (query.isNotEmpty) {
              newsController.searchnews(query);
            }
          },
          child: const Icon(Icons.search, color: Colors.deepOrange),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
