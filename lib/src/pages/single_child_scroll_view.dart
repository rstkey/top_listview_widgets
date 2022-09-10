import 'package:flutter/material.dart';

class SingleChildScrollViewPage extends StatelessWidget {
  const SingleChildScrollViewPage({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.arrow_forward)),
              Tab(icon: Icon(Icons.arrow_downward_sharp)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            horizontal(context),
            vertical(context),
          ],
        ),
      ),
    );
  }
}

horizontal(context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        customContainer('Item 1', Colors.red[100], context),
        customContainer('Item 2', Colors.blue[100], context),
        customContainer('Item 3', Colors.green[100], context),
      ],
    ),
  );
}

Container customContainer(text, color, context,
    {double? height, bool? isVertical}) {
  return Container(
    alignment: Alignment.center,
    color: color,
    height: !(isVertical ?? false)
        ? MediaQuery.of(context).size.height
        : height ?? 200,
    width: isVertical ?? false ? MediaQuery.of(context).size.width : 200,
    child: Text(text),
  );
}

vertical(context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        customContainer('Item 1', Colors.red[100], context, isVertical: true),
        customContainer('Item 2', Colors.blue[100], context,
            height: 500, isVertical: true),
        customContainer('Item 3', Colors.purple[100], context,
            height: 150, isVertical: true),
      ],
    ),
  );
}
