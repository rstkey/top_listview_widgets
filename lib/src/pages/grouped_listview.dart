import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class GroupedListViewPage extends StatefulWidget {
  const GroupedListViewPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<GroupedListViewPage> createState() => _GroupedListViewPageState();
}

class _GroupedListViewPageState extends State<GroupedListViewPage> {
  final elements = [
    {"group": "Team A", "name": "John A"},
    {"group": "Team B", "name": "Will B"},
    {"group": "Team C", "name": "Mike C"},
    {"group": "Team D", "name": "Wayne D"},
    {"group": "Team A", "name": "John A"},
    {"group": "Team B", "name": "John B"},
    {"group": "Team B", "name": "John B"},
    {"group": "Team A", "name": "John"},
    {"group": "Team C", "name": "John C"},
    {"group": "Team D", "name": "John D"},
    {"group": "Team D", "name": "Wayne D"},
    {"group": "Team D", "name": "Wayne D"},
    {"group": "Team D", "name": "Wayne D"},
    {"group": "Team D", "name": "Wayne D"},
    {"group": "Team B", "name": "John B"},
    {"group": "Team B", "name": "John B"},
    {"group": "Team B", "name": "John B"},
    {"group": "Team B", "name": "John B"},
    {"group": "Team B", "name": "Will B"},
    {"group": "Team C", "name": "Mike C"},
    {"group": "Team C", "name": "Mike C"},
    {"group": "Team C", "name": "Mike C"},
    {"group": "Team C", "name": "Mike C"},
    {"group": "Team A", "name": "John A"},
    {"group": "Team A", "name": "John A"},
    {"group": "Team A", "name": "John A"},
    {"group": "Team B", "name": "Will B"},
    {"group": "Team C", "name": "Mike C"},
    {"group": "Team D", "name": "Wayne D"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GroupedListView<dynamic, String>(
        useStickyGroupSeparators: true, //yukarıya sabitler
        itemComparator: (item1, item2) =>
            item1['name'].compareTo(item2['name']),
        elements: elements,
        groupBy: (element) => element['group'],
        groupSeparatorBuilder: (value) => Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          color: Colors.blueGrey,
          child: Text(
            value,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        itemBuilder: (context, element) => Card(
          elevation: 2,
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            leading: const Icon(
              Icons.account_circle,
            ),
            title: Text(
              element['name'],
            ),
          ),
        ),
      ),
    );
  }
}
