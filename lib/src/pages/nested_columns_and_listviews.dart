import 'package:flutter/material.dart';

class NestedColumnsAndListViewsPage extends StatelessWidget {
  const NestedColumnsAndListViewsPage({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            color: Colors.red,
            child: const Center(
              child: Text('Some Widgets'),
            ),
          ),
          Flexible(
            child: ListView.builder(
                itemCount: 30,
                shrinkWrap: true,
                itemBuilder: (context, index) => ListTile(
                      title: Text('Item ${index + 1}'),
                    )),
          )
        ],
      ),
    );
  }
}
