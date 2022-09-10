import 'package:flutter/material.dart';

class PullToRefreshPage extends StatefulWidget {
  const PullToRefreshPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<PullToRefreshPage> createState() => _PullToRefreshPageState();
}

class _PullToRefreshPageState extends State<PullToRefreshPage> {
  List<String> items = ["dlfksjf", "lkodsjıf", "kfjkd", "ksdjh"];

  Future refresh() async {
    setState(() {
      items = ["1", "2", "3", "4"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
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
