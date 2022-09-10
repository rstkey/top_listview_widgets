import 'package:flutter/material.dart';
import 'package:top_listview_widgets/constants.dart';
import 'package:top_listview_widgets/src/pages/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TOP 13 LISTVIEW WIDGETS"),
      ),
      body: ListView.builder(
          itemCount: pageItems.length,
          itemBuilder: (context, index) {
            final item = pageItems[index]["pageName"] as String;
            final route = pageItems[index]["route"] as Widget;

            return ListTile(
              title: customCard(index, item),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => route)),
            );
          }),
    );
  }

  Card customCard(int index, String item) {
    return Card(
      color: (index % 2 == 0) ? Colors.blueGrey[100] : Colors.blueGrey[50],
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          item,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
