import 'package:af_animations/af_animations.dart';
import 'package:flutter/material.dart';



class AfBuilderPageOptimized extends StatefulWidget {
  const AfBuilderPageOptimized({
    super.key,
  });

  @override
  State<AfBuilderPageOptimized> createState() => _AfBuilderPageOptimizedState();
}

class _AfBuilderPageOptimizedState extends State<AfBuilderPageOptimized> {

  /// Code from: Flutter App Counter (https://dartpad.dev/?id=e75b493dae1287757c5e1d77a0dc73f1)
  int _counter = 0;

  void _incrementCounter() {
    _counter++;
    AfAnimations.update(context, ids: ["AfBuilder Optimized Demo"]);
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                '   You have pushed the button this many times:   ',
                textAlign: TextAlign.center,
              ).afShowRepaint(context),
            ),

            const SizedBox(height: 10).afShowRepaint(context),

            AfBuilder(
              id: "AfBuilder Optimized Demo",
              builder: (context, child) {
                return Text(
                  ' $_counter ',
                  style: Theme.of(context).textTheme.headlineMedium,
                ).afShowRepaint(context);
              },
            ),

            const SizedBox(height: 20).afShowRepaint(context),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                " A color change is a widget rebuild, it may not seem like much, but in production applications, it's important to optimize everything. ",
                textAlign: TextAlign.center,
                textScaleFactor: 0.75,
              ).afShowRepaint(context),
            ),
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

