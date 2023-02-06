import 'package:flutter/material.dart';

class Counte extends StatelessWidget {
  Counte({Key? key}) : super(key: key);
  ValueNotifier<int> _count = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Count Example'),
        ),
        body: Center(
          child: ValueListenableBuilder(
              builder: (context, value, child) => Text(_count.value.toString()),
              valueListenable: _count),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _count.value++;
          },
          child: Icon(Icons.add),
        ));
  }
}
