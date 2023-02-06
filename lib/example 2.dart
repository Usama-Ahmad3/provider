import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'example_2 provider.dart';

// ignore: camel_case_types
class Example_2 extends StatefulWidget {
  const Example_2({Key? key}) : super(key: key);

  @override
  State<Example_2> createState() => _Example_2State();
}

// ignore: camel_case_types
class _Example_2State extends State<Example_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example 2'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Consumer<Exmaple_2P>(
                builder: (context, value, child) => Slider(
                    max: 1,
                    min: 0,
                    value: value.value,
                    onChanged: (val) {
                      value.setValue(val);
                    })),
          ),
          Consumer<Exmaple_2P>(
            builder: (context, value, child) => Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.value)),
                    child: const Center(child: Text('Container 1')),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(value.value)),
                    child: const Center(child: Text('Container 2')),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
