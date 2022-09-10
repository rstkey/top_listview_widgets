import 'package:flutter/material.dart';

class ReorderableListViewPage extends StatelessWidget {
  const ReorderableListViewPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text(title),

      ),
    );
  }
}
