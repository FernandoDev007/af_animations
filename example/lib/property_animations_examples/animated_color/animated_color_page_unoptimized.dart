import 'package:af_animations/af_animations.dart';
import 'package:flutter/material.dart';

class AfAnimatedColorPageUnoptimized extends StatefulWidget {
  const AfAnimatedColorPageUnoptimized({
    super.key,
  });

  @override
  State<AfAnimatedColorPageUnoptimized> createState() => _AfAnimatedColorPageUnoptimizedState();
}

class _AfAnimatedColorPageUnoptimizedState extends State<AfAnimatedColorPageUnoptimized> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<Color?> colorAnimation;
  
  Color startColor = Colors.blue;
  Color endColor = Colors.red;
  
  List<Color> availableColors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.purple,
    Colors.orange,
  ];
  
  int colorIndex = 0;

  @override
  void initState() {
    super.initState();
    
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    
    _updateColorAnimation();

    // Bad practice: Using setState in the animation listener
    // causes the entire widget tree to rebuild on every frame
    controller.addListener(() {
      setState(() {
        // This forces a rebuild of the entire widget tree
        // instead of just updating the color
      });
    });
  }

  void _updateColorAnimation() {
    colorAnimation = ColorTween(
      begin: startColor,
      end: endColor,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  void _changeColor() {
    // Update the colors manually
    startColor = endColor;
    colorIndex = (colorIndex + 1) % availableColors.length;
    endColor = availableColors[colorIndex];
    
    // Recreate the animation with new colors
    _updateColorAnimation();
    
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: AppBar(
          title: const Padding(
            padding: EdgeInsets.all(3.0),
            child: Text(" Without AfAnimatedColor Demo "),
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
                  " Without using AfAnimatedColor, poor animation practices are employed in this color animation. ",
                  textAlign: TextAlign.center,
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 20).afShowRepaint(context),

              GestureDetector(
                onTap: _changeColor,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: colorAnimation.value ?? Colors.blue,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: (colorAnimation.value ?? Colors.blue).withValues(alpha: 0.5),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: const Text(
                        "Tap to change color",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ).afShowRepaint(context),
                    ),
                  ),
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 20).afShowRepaint(context),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: _changeColor,
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(" Animate Color "),
                  ).afShowRepaint(context),
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 20).afShowRepaint(context),

              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  " Problems with this implementation:\n"
                  " • Using setState in AnimationController listener causes unnecessary rebuilds\n"
                  " • Manual creation and update of ColorTween animation\n"
                  " • Rebuilding the entire widget tree on every animation frame\n" 
                  " • Inefficient handling of color transitions\n"
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