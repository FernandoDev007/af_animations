import 'package:af_animations/af_animations.dart';
import 'package:flutter/material.dart';

class AfAnimatedScalePageOptimized extends StatefulWidget {
  const AfAnimatedScalePageOptimized({
    super.key,
  });

  @override
  State<AfAnimatedScalePageOptimized> createState() => _AfAnimatedScalePageOptimizedState();
}

class _AfAnimatedScalePageOptimizedState extends State<AfAnimatedScalePageOptimized> {

  double currentScale = 1.0;
  int currentStep = 0;
  
  final List<double> scales = [
    1.0,    // Normal size
    1.5,    // 150% size
    0.7,    // 70% size
    2.0,    // Double size
    0.5,    // Half size
  ];

  void _toggleScale() {
    currentStep = (currentStep + 1) % scales.length;
    currentScale = scales[currentStep];
    AfAnimations.update(context, ids: ["AfAnimatedScale Demo"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: AppBar(
          title: const Padding(
            padding: EdgeInsets.all(3.0),
            child: Text(" AfAnimatedScale Demo "),
          ).afShowRepaint(context),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back),
          ).afShowRepaint(context),
        ).afShowRepaint(context),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  " Using AfAnimatedScale, smooth scale transitions can be applied with optimal performance using Transform.scale. ",
                  textAlign: TextAlign.center,
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 30).afShowRepaint(context),

              GestureDetector(
                onTap: _toggleScale,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: AfAnimatedScale(
                      id: "AfAnimatedScale Demo",
                      scale: () => currentScale,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: const Text(
                            " Animate ",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ).afShowRepaint(context),
                        ),
                      ).afShowRepaint(context),
                    ),
                  ),
                ).afShowRepaint(context),
              ),

              const SizedBox(height: 30).afShowRepaint(context),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: _toggleScale,
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(" Animate Scale "),
                  ).afShowRepaint(context),
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 10).afShowRepaint(context),

              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  " AfAnimatedScale provides smooth scale transitions using Transform.scale, perfect for zoom animations and scaling effects without affecting layout performance. ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 11),
                ),
              ).afShowRepaint(context),
            ],
          ).afShowRepaint(context),
        ),
      ).afShowRepaint(context),
    );
  }
} 