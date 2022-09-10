import 'package:flutter/material.dart';

class InfiniteScrollingListViewPage extends StatefulWidget {
  const InfiniteScrollingListViewPage({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  State<InfiniteScrollingListViewPage> createState() =>
      _InfiniteScrollingListViewPageState();
}

class _InfiniteScrollingListViewPageState
    extends State<InfiniteScrollingListViewPage> {
  final controller = ScrollController();
  List<String> items = List.generate(15, (index) => 'Item ${index + 1}');

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetch();
      }
    });
  }

  Future fetch() async {
    setState(() {
      items.addAll(["item a", "item b", "item c", "item d"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          controller: controller,
          padding: const EdgeInsets.all(8),
          itemCount: items.length + 1,
          itemBuilder: (context, index) {
            if (index < items.length) {
              final item = items[index];
              return ListTile(
                title: Text(item),
              );
            } else {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }),
    );
  }
}
