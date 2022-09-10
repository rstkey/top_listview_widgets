import 'package:flutter/material.dart';

class SingleChildScrollViewPage extends StatelessWidget {
  const SingleChildScrollViewPage({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.red[100],
              height: 200,
              child: const Text('Item 1'),
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.blue[100],
              height: 500,
              child: const Text('Item 2'),
            )
          ],
        ),
      ),
    );
  }
}
