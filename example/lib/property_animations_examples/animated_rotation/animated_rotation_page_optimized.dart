import 'package:af_animations/af_animations.dart';
import 'package:flutter/material.dart';

class AfAnimatedRotationPageOptimized extends StatefulWidget {
  const AfAnimatedRotationPageOptimized({
    super.key,
  });

  @override
  State<AfAnimatedRotationPageOptimized> createState() => _AfAnimatedRotationPageOptimizedState();
}

class _AfAnimatedRotationPageOptimizedState extends State<AfAnimatedRotationPageOptimized> {

  double currentAngle = 0.0;
  int currentStep = 0;
  
  final List<double> angles = [
    0,                    // 0 degrees
    90,           // 90 degrees
    180,               // 180 degrees
    270,       // 270 degrees
    360,           // 360 degrees (full rotation)
  ];

  void _toggleRotation() {
    currentStep = (currentStep + 1) % angles.length;
    currentAngle = angles[currentStep];
    AfAnimations.update(context, ids: ["AfAnimatedRotation Demo"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: AppBar(
          title: const Padding(
            padding: EdgeInsets.all(3.0),
            child: Text(" AfAnimatedRotation Demo "),
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
                  " Using AfAnimatedRotation, smooth rotation transitions can be applied with optimal performance using Transform.rotate. ",
                  textAlign: TextAlign.center,
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 30).afShowRepaint(context),

              GestureDetector(
                onTap: _toggleRotation,
                child: SizedBox(
                  width: 200,
                  height: 150,
                  child: Center(
                    child: AfAnimatedRotation(
                      id: "AfAnimatedRotation Demo",
                      angle: () => currentAngle,
                      child: Container(
                        width: 200,
                        height: 150,
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
                ),
              ),

              const SizedBox(height: 30).afShowRepaint(context),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: _toggleRotation,
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(" Animate Rotation "),
                  ).afShowRepaint(context),
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 10).afShowRepaint(context),

              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  " AfAnimatedRotation provides smooth rotation transitions using Transform.rotate, perfect for spin animations and rotational effects without affecting layout performance. ",
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