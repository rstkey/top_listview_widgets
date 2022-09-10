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
              Tab(icon: Icon(Icons.space_bar)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            horizontal(context),
            vertical(context),
            spaceEvenly(),
          ],
        ),
      ),
    );
  }
}

spaceEvenly() {
  return LayoutBuilder(
    builder: (context, constraints) => SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: constraints.maxHeight,
        ),
        child: IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              customContainer(
                'Item 1',
                Colors.red[100],
              ),
              customContainer(
                'Item 2',
                Colors.blue[100],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}


horizontal(context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        customContainer(
          'Item 1',
          Colors.red[100],
        ),
        customContainer(
          'Item 2',
          Colors.blue[100],
        ),
        customContainer(
          'Item 3',
          Colors.green[100],
        ),
      ],
    ),
  );
}

Container customContainer(text, color, {double? height}) {
  return Container(
    alignment: Alignment.center,
    color: color,
    height: height ?? 200,
    width: 200,
    child: Text(text),
  );
}

vertical(context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        customContainer(
          'Item 1',
          Colors.red[100],
        ),
        customContainer(
          'Item 2',
          Colors.blue[100],
        ),
        customContainer(
          'Item 3',
          Colors.purple[100],
        ),
      ],
    ),
  );
}
