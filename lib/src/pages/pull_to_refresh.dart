import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PullToRefreshPage extends StatefulWidget {
  const PullToRefreshPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<PullToRefreshPage> createState() => _PullToRefreshPageState();
}

class _PullToRefreshPageState extends State<PullToRefreshPage> {
  List<String> items = ["dlfksjf", "lkodsjıf", "kfjkd", "ksdjh"];

  Future refresh() async {
    setState(() => items.clear());
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List newItems = json.decode(response.body);

      setState(() {
        items = newItems.map<String>((item) {
          final number = item['id'];
          return 'Item $number';
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: items.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: refresh,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return ListTile(
                      title: Text(item),
                    );
                  }),
            ),
    );
  }
}
