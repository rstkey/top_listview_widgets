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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              color: Colors.red,
              child: const Center(
                child: Text('Some Widgets'),
              ),
            ),
            ListView.builder(
                primary: false,//listview'in scroll unu geçersiz kılma
                itemCount: 30,
                shrinkWrap: true,//limit height
                itemBuilder: (context, index) => ListTile(
                      title: Text('Item ${index + 1}'),
                    ))
          ],
        ),
      ),
    );
  }
}
