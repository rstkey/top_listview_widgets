import 'package:flutter/material.dart';

class SpreadOperatorPage extends StatefulWidget {
  const SpreadOperatorPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SpreadOperatorPage> createState() => _SpreadOperatorPageState();
}

class _SpreadOperatorPageState extends State<SpreadOperatorPage> {
  final items=const[Text('Item 2'),Text('Item3')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const Text('Item 1'),
            // Column(children: items,),
            ...items,
            const Text('Item 4'),
          ],
        ),
      ),
    );
  }
}
