import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:http/http.dart' as http;
import 'package:top_listview_widgets/src/models/image.dart' as model;
import 'package:top_listview_widgets/urls.dart';

class StickyHeaderPage extends StatefulWidget {
  const StickyHeaderPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<StickyHeaderPage> createState() => _StickyHeaderPageState();
}

class _StickyHeaderPageState extends State<StickyHeaderPage> {
  late Future<List<model.Image>> images;
  final String defaultImageUrl =
      'https://images.unsplash.com/photo-1529655683826-aba9b3e77383?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80';

  @override
  void initState() {
    super.initState();
    images = getImages();
  }

  static Future<List<model.Image>> getImages() async {
    const url =
        "https://api.unsplash.com/search/photos?query=london&client_id=$clientId";
    final response = await http.get(Uri.parse(url));
    final body = jsonDecode(response.body);
    return body['results'].map<model.Image>(model.Image.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            bottom: const TabBar(
              labelPadding: EdgeInsets.all(8.0),
              tabs: [
                Text("StickyHeader"),
                Text("WithBuilder"),
                Text(""),
              ],
            ),
          ),
          body: FutureBuilder<List<model.Image>>(
            future: getImages(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final images = snapshot.data!;
                return TabBarView(
                  children: [stickyHeader(images), stickyHeaderBuilder(images)],
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              return const SizedBox();
            },
          )),
    );
  }

  ListView stickyHeaderBuilder(List<model.Image> images) {
    return ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          final image = images[index];
          return StickyHeaderBuilder(
            builder: (context, stuckAmount) {
              stuckAmount = 1 - stuckAmount.clamp(0, 1);
              return Container(
                width: double.infinity,
                color: Color.lerp(
                    Colors.blueGrey[50], Colors.blueGrey[200], stuckAmount),
                padding: const EdgeInsets.all(16),
                child: Text(image.description ?? "default "),
              );
            },
            content: Image.network(
              image.raw ?? defaultImageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
          );
        });
  }

  ListView stickyHeader(List<model.Image> images) {
    return ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          final image = images[index];
          return StickyHeader(
            content: Image.network(
              image.raw ?? defaultImageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
            header: Container(
              width: double.infinity,
              color: Colors.blueGrey[50],
              padding: const EdgeInsets.all(16),
              child: Text(image.description ?? "default "),
            ),
          );
        });
  }
}
