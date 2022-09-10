import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:top_listview_widgets/src/models/book.dart';

class ListViewWithJsonDataPage extends StatefulWidget {
  const ListViewWithJsonDataPage({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  State<ListViewWithJsonDataPage> createState() =>
      _ListViewWithJsonDataPageState();
}

class _ListViewWithJsonDataPageState extends State<ListViewWithJsonDataPage> {
  late Future<List<Book>> books;

  @override
  void initState() {
    super.initState();
    books = getBooks(context);
  }

  static Future<List<Book>> getBooks(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/books.json');
    final body = json.decode(data);
    return body.map<Book>(Book.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<List<Book>>(
          future: books,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              final books = snapshot.data!;
              return buildBooks(books);
            } else if (snapshot.hasError) {
              return Text('😢 ${snapshot.error}');
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget buildBooks(List<Book> books) => ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(book.urlAvatar),
            ),
            title: Text(book.title),
            subtitle: Text(book.name),
          ),
        );
      });
}
