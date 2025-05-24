import 'package:flutter/material.dart';

export 'package:af_animations_example/effect_animations_examples/effect_animations_page.dart';
export 'package:af_animations_example/layout_animations_examples/animated_clip_rrect/animated_clip_rrect_page_optimized.dart';
export 'package:af_animations_example/layout_animations_examples/animated_clip_rrect/animated_clip_rrect_page_unoptimized.dart';
export 'package:af_animations_example/layout_animations_examples/layout_animations_page.dart';
export 'package:af_animations_example/property_animations_examples/animated_secondary_value/animated_secondary_value_page_unoptimized.dart';
export 'package:af_animations_example/property_animations_examples/animated_value/animated_value_page_optimized.dart';
export 'package:af_animations_example/property_animations_examples/animated_value/animated_value_page_unoptimized.dart';
export 'package:af_animations_example/property_animations_examples/property_animations_page.dart';
export 'package:af_animations_example/sequence_animations_examples/sequence_animations_page.dart';
export 'package:af_animations_example/transition_animations_examples/transition_animations_page.dart';
export 'package:af_animations_example/utility_widgets_examples/builder/builder_page_optimized.dart';
export 'package:af_animations_example/utility_widgets_examples/builder/builder_page_unoptimized.dart';
export 'package:af_animations_example/utility_widgets_examples/utility_widgets_page.dart';


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
              const SizedBox(height: 30),

              // Property Animations
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/property_animations");
                  },
                  child: const Text(
                    "🎯 Property Animations\nAnimate specific widget properties",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14)
                  )
                ),
              ),

              const SizedBox(height: 15),

              // Layout Animations
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/layout_animations");
                  },
                  child: const Text(
                    "🏗️ Layout Animations\nAnimate layout and structure changes",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14)
                  )
                ),
              ),

              const SizedBox(height: 15),

              // Effect Animations
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/effect_animations");
                  },
                  child: const Text(
                    "✨ Effect Animations\nSimple entrance and exit effects",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14)
                  )
                ),
              ),

              const SizedBox(height: 15),

              // Transition Animations
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/transition_animations");
                  },
                  child: const Text(
                    "↔️ Transition Animations\nAnimate between screens",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14)
                  )
                ),
              ),

              const SizedBox(height: 15),

              // Sequence Animations
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/sequence_animations");
                  },
                  child: const Text(
                    "🎬 Sequence Animations\nComplex and sequential animations",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14)
                  )
                ),
              ),

              const SizedBox(height: 15),

              // Utility Widgets
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/utility_widgets");
                  },
                  child: const Text(
                    "🔧 Utility Widgets\nTools and helpers",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14)
                  )
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        )
      ),
    );
  }
}
