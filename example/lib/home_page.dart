import 'package:flutter/material.dart';

export 'package:af_animations_example/implicitly_examples_demo/animated_clip_rrect_page_optimized.dart';
export 'package:af_animations_example/implicitly_examples_demo/animated_clip_rrect_page_unoptimized.dart';
export 'package:af_animations_example/implicitly_examples_demo/implicitly_page.dart';
export 'package:af_animations_example/other_widgets_examples_demo/af_builder_page_optimized.dart';
export 'package:af_animations_example/other_widgets_examples_demo/af_builder_page_unoptimized.dart';
export 'package:af_animations_example/other_widgets_examples_demo/other_widgets_page.dart';
export 'package:af_animations_example/value_examples_demo/animated_secondary_value_page_unoptimized.dart';
export 'package:af_animations_example/value_examples_demo/animated_value_page_optimized.dart';
export 'package:af_animations_example/value_examples_demo/animated_value_page_unoptimized.dart';
export 'package:af_animations_example/value_examples_demo/value_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: AppBar(
          title: const Text('Af Animations App Demo'),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/value_demo");
                  },
                  child: const Text("Value Animations", textAlign: TextAlign.center)
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/implicitly_demo");
                  },
                  child: const Text("Implicitly Animations", textAlign: TextAlign.center)
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const ElevatedButton(
                  onPressed: null, ///In progress
                  child: Text("Interval Animations", textAlign: TextAlign.center)
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const ElevatedButton(
                  onPressed: null, ///In progress
                  child: Text("Simple Animations", textAlign: TextAlign.center)
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const ElevatedButton(
                  onPressed: null, ///In progress
                  child: Text("Navigation Animations", textAlign: TextAlign.center)
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/other_widgets_demo");
                  },
                  child: const Text("Other Widgets", textAlign: TextAlign.center)
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        )
      ),
    );
  }
}
