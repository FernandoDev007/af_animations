import 'dart:math' as math;

import 'package:af_animations/af_animations.dart';
import 'package:flutter/material.dart';

class AfAnimatedRotationPageUnoptimized extends StatefulWidget {
  const AfAnimatedRotationPageUnoptimized({
    super.key,
  });

  @override
  State<AfAnimatedRotationPageUnoptimized> createState() => _AfAnimatedRotationPageUnoptimizedState();
}

class _AfAnimatedRotationPageUnoptimizedState extends State<AfAnimatedRotationPageUnoptimized> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> rotationAnimation;
  
  double currentAngle = 0.0;
  int currentStep = 0;
  
  final List<double> angles = [
    0.0,                    // 0 degrees
    math.pi / 2,           // 90 degrees
    math.pi,               // 180 degrees
    3 * math.pi / 2,       // 270 degrees
    2 * math.pi,           // 360 degrees (full rotation)
  ];

  @override
  void initState() {
    super.initState();
    
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    
    _updateRotationAnimation();

    // Bad practice: Using setState in the animation listener
    // causes the entire widget tree to rebuild on every frame
    controller.addListener(() {
      setState(() {
        // This forces a rebuild of the entire widget tree
        // instead of just updating the rotation
      });
    });
  }

  void _updateRotationAnimation() {
    rotationAnimation = Tween<double>(
      begin: currentAngle,
      end: angles[currentStep],
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  void _toggleRotation() {
    // Update the target angle manually
    currentStep = (currentStep + 1) % angles.length;
    currentAngle = rotationAnimation.value;
    
    // Recreate the animation with new angle values
    _updateRotationAnimation();
    
    // Reset and restart the animation
    controller.reset();
    controller.forward();
  }

  String _getAngleDescription() {
    double angleInDegrees = rotationAnimation.value * 180 / math.pi;
    return "${angleInDegrees.toInt()}°";
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double animatedAngle = rotationAnimation.value;
    
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: AppBar(
          title: const Padding(
            padding: EdgeInsets.all(3.0),
            child: Text(" Without AfAnimatedRotation Demo "),
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
                  " Without using AfAnimatedRotation, poor animation practices are employed in this rotation animation. ",
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
                    child: Transform.rotate(
                      angle: animatedAngle,
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
                  " Problems with this implementation:\n"
                  " • Using setState in AnimationController listener causes unnecessary rebuilds\n"
                  " • Manual creation and update of rotation Tween animation\n"
                  " • Rebuilding the entire widget tree on every animation frame\n" 
                  " • Inefficient handling of rotation transitions\n"
                  " • Manual management of AnimationController lifecycle\n"
                  " • Complex state management for angle values\n"
                  " • Difficult to reuse in other parts of the application",
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