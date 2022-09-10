import 'package:flutter/material.dart';
import 'package:top_listview_widgets/src/models/Book.dart';

class ListViewWithJsonDataPage extends StatefulWidget {
  const ListViewWithJsonDataPage({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  State<ListViewWithJsonDataPage> createState() =>
      _ListViewWithJsonDataPageState();
}

class _ListViewWithJsonDataPageState extends State<ListViewWithJsonDataPage> {
  Future<List<Book>> books = getBooks();
  static Future<List<Book>> getBooks() async {
    const data = [
      {
        "title": "Fyunli (A Garhwali Haiku)",
        "name": "Sunil Uniyal",
        "urlAvatar": "https://www.poemist.com/images/poet-pen.png"
      },
      {
        "title": "Lament XVII",
        "name": "Jan Kochanowski",
        "urlAvatar": "https://www.poemist.com/images/poet-pen.png"
      },
      {
        "title": "In The Valley Of The Waters",
        "name": "George Gordon Byron",
        "urlAvatar":
            "https://www.poemist.com/storage/poets-avatars/202206/george-gordon-byron.jpg"
      },
      {
        "title": "Bekjendelser",
        "name": "Bernhard Severi Ingemann",
        "urlAvatar": "https://www.poemist.com/images/poet-pen.png"
      },
      {
        "title": "The Boy’s Appeal -",
        "name": "Rosanna Eleanor Leprohon",
        "urlAvatar": "https://www.poemist.com/images/poet-pen.png"
      }
    ];

    return data.map<Book>(Book.fromJson).toList();
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
            final books = snapshot.data!;
            return buildBooks(books);
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
