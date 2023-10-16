import 'package:af_animations/af_animations.dart';
import 'package:flutter/material.dart';



class AfBuilderPageUnoptimized extends StatefulWidget {
  const AfBuilderPageUnoptimized({
    super.key,
  });

  @override
  State<AfBuilderPageUnoptimized> createState() => _AfBuilderPageUnoptimizedState();
}

class _AfBuilderPageUnoptimizedState extends State<AfBuilderPageUnoptimized> with SingleTickerProviderStateMixin {

  /// Code from: Flutter App Counter (https://dartpad.dev/?id=e75b493dae1287757c5e1d77a0dc73f1)
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: AppBar(
          title: const Text("  AfBuilder Demo  ").afShowRepaint(context),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back),
          ).afShowRepaint(context),
        ).afShowRepaint(context),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '   You have pushed the button this many times:   ',
            ).afShowRepaint(context),
            Text(
              ' $_counter ',
              style: Theme.of(context).textTheme.headlineMedium,
            ).afShowRepaint(context),
          ],
        ).afShowRepaint(context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add).afShowRepaint(context),
      ).afShowRepaint(context),
    );
  }

}

