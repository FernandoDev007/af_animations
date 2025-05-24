import 'package:af_animations/af_animations.dart';
import 'package:flutter/material.dart';

class AfAnimatedBoxDecorationPageUnoptimized extends StatefulWidget {
  const AfAnimatedBoxDecorationPageUnoptimized({
    super.key,
  });

  @override
  State<AfAnimatedBoxDecorationPageUnoptimized> createState() => _AfAnimatedBoxDecorationPageUnoptimizedState();
}

class _AfAnimatedBoxDecorationPageUnoptimizedState extends State<AfAnimatedBoxDecorationPageUnoptimized> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<Decoration?> decorationAnimation;
  
  int currentStep = 0;
  
  List<BoxDecoration> get decorations => [
    // Simple solid color with rounded corners
    BoxDecoration(
      color: Colors.indigo,
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

  @override
  void initState() {
    super.initState();
    
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    
    _updateDecorationAnimation();

    // Bad practice: Using setState in the animation listener
    // causes the entire widget tree to rebuild on every frame
    controller.addListener(() {
      setState(() {
        // This forces a rebuild of the entire widget tree
        // instead of just updating the decoration
      });
    });
  }

  void _updateDecorationAnimation() {
    final int nextStep = (currentStep + 1) % decorations.length;
    decorationAnimation = DecorationTween(
      begin: decorations[currentStep],
      end: decorations[nextStep],
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  void _toggleDecoration() {
    // Update the target decoration manually
    currentStep = (currentStep + 1) % decorations.length;
    
    // Recreate the animation with new decoration values
    _updateDecorationAnimation();
    
    // Reset and restart the animation
    controller.reset();
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Decoration? animatedDecoration = decorationAnimation.value;
    
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: AppBar(
          title: const Padding(
            padding: EdgeInsets.all(3.0),
            child: Text(" Without AfAnimatedBoxDecoration Demo "),
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
                  " Without using AfAnimatedBoxDecoration, poor animation practices are employed in this decoration animation. ",
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
                    child: DecoratedBox(
                      decoration: animatedDecoration ?? decorations[currentStep],
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
                  " Problems with this implementation:\n"
                  " • Using setState in AnimationController listener causes unnecessary rebuilds\n"
                  " • Manual creation and update of DecorationTween animation\n"
                  " • Rebuilding the entire widget tree on every animation frame\n" 
                  " • Inefficient handling of decoration transitions\n"
                  " • Manual management of AnimationController lifecycle\n"
                  " • Complex state management for decoration values\n"
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