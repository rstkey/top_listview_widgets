import 'package:flutter/material.dart';

class NestedColumnsAndListViewsPage extends StatelessWidget {
  const NestedColumnsAndListViewsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text(title),

      ),
    );
  }
}
