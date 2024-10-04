
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:news_getx/api/constand.dart';

import 'package:news_getx/newscontroller.dart';
import 'package:url_launcher/url_launcher.dart';


class HomePage extends StatelessWidget {
  final NewsController newsController = Get.put(NewsController()); 
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        backgroundColor: const Color.fromARGB(255, 215, 99, 91),
      ),
      body: Obx(() {
        if (newsController.isLoading.value) {
          return const Center(child: CircularProgressIndicator()); 
        }

        return ListView.builder(
          itemCount: newsController.articles.length,
          itemBuilder: (context, index) {
            final article = newsController.articles[index];
            return ListTile(
              onTap: () {
                _launchURL(Uri.parse(article.url ?? ""));
              },
              leading: SizedBox(
                height: 80,
                width: 80,
                child: Image.network(
                  article.image ?? IMAGE_LINK,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(article.title ?? "No Title"),
              subtitle: Text(article.publishedAt ?? ""),
            );
          },
        );
      }),
    );
  }

  Future<void> _launchURL(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
