import 'package:af_animations/af_animations.dart';
import 'package:flutter/material.dart';

class AfAnimatedBoxDecorationPageOptimized extends StatefulWidget {
  const AfAnimatedBoxDecorationPageOptimized({
    super.key,
  });

  @override
  State<AfAnimatedBoxDecorationPageOptimized> createState() => _AfAnimatedBoxDecorationPageOptimizedState();
}

class _AfAnimatedBoxDecorationPageOptimizedState extends State<AfAnimatedBoxDecorationPageOptimized> {

  int currentStep = 0;
  
  List<BoxDecoration> get decorations => [
    // Simple solid color with rounded corners
    BoxDecoration(
      color: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(12),
    ),
    // Gradient with shadow
    BoxDecoration(
      gradient: const LinearGradient(
        colors: [Colors.purple, Colors.pink],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.purple.withOpacity(0.3),
          blurRadius: 15,
          offset: const Offset(0, 8),
        ),
      ],
    ),
    // Border with different radius
    BoxDecoration(
      color: Colors.green.shade100,
      borderRadius: BorderRadius.circular(30),
      border: Border.all(
        color: Colors.green,
        width: 3,
      ),
    ),
    // Complex decoration with multiple shadows
    BoxDecoration(
      gradient: const LinearGradient(
        colors: [Colors.orange, Colors.red],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.orange.withOpacity(0.4),
          blurRadius: 10,
          offset: const Offset(-5, -5),
        ),
        BoxShadow(
          color: Colors.red.withOpacity(0.4),
          blurRadius: 10,
          offset: const Offset(5, 5),
        ),
      ],
    ),
    // Different shape and color
    BoxDecoration(
      color: Colors.indigo,
      borderRadius: BorderRadius.circular(50),
      border: Border.all(
        color: Colors.white,
        width: 2,
      ),
    ),
  ];

  void _toggleDecoration() {
    currentStep = (currentStep + 1) % decorations.length;
    AfAnimations.update(context, ids: ["AfAnimatedBoxDecoration Demo"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: AppBar(
          title: const Padding(
            padding: EdgeInsets.all(3.0),
            child: Text(" AfAnimatedBoxDecoration Demo "),
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
                  " Using AfAnimatedBoxDecoration, smooth decoration transitions can be applied with optimal performance using DecorationTween. ",
                  textAlign: TextAlign.center,
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 30).afShowRepaint(context),

              GestureDetector(
                onTap: _toggleDecoration,
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Center(
                    child: AfAnimatedBoxDecoration(
                      id: "AfAnimatedBoxDecoration Demo",
                      decoration: () => decorations[currentStep],
                      child: SizedBox(
                        width: 200,
                        height: 200,
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
                  onPressed: _toggleDecoration,
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(" Animate BoxDecoration "),
                  ).afShowRepaint(context),
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 10).afShowRepaint(context),

              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  " AfAnimatedBoxDecoration provides smooth decoration transitions using DecorationTween, perfect for animating colors, gradients, borders, shadows, and border radius without affecting layout performance. ",
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