import 'package:af_animations/af_animations.dart';
import 'package:flutter/material.dart';

class AfAnimatedOpacityPageUnoptimized extends StatefulWidget {
  const AfAnimatedOpacityPageUnoptimized({
    super.key,
  });

  @override
  State<AfAnimatedOpacityPageUnoptimized> createState() => _AfAnimatedOpacityPageUnoptimizedState();
}

class _AfAnimatedOpacityPageUnoptimizedState extends State<AfAnimatedOpacityPageUnoptimized> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> opacityAnimation;
  
  double currentOpacity = 1.0;
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    
    _updateOpacityAnimation();

    // Bad practice: Using setState in the animation listener
    // causes the entire widget tree to rebuild on every frame
    controller.addListener(() {
      setState(() {
        // This forces a rebuild of the entire widget tree
        // instead of just updating the opacity
      });
    });
  }

  void _updateOpacityAnimation() {
    opacityAnimation = Tween<double>(
      begin: currentOpacity,
      end: isVisible ? 1.0 : 0.25,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  void _toggleOpacity() {
    // Update the target opacity manually
    isVisible = !isVisible;
    currentOpacity = opacityAnimation.value;
    
    // Recreate the animation with new opacity values
    _updateOpacityAnimation();
    
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
            child: Text(" Without AfAnimatedOpacity Demo "),
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
                  " Without using AfAnimatedOpacity, poor animation practices are employed in this opacity animation. ",
                  textAlign: TextAlign.center,
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 20).afShowRepaint(context),

              GestureDetector(
                onTap: _toggleOpacity,
                child: Center(
                  child: Opacity(
                    opacity: opacityAnimation.value,
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: const Text(
                          "Animated Content",
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
                ).afShowRepaint(context),
              ),

              const SizedBox(height: 20).afShowRepaint(context),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: _toggleOpacity,
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(" Animate Opacity "),
                  ).afShowRepaint(context),
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 10).afShowRepaint(context),

              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  " Problems with this implementation:\n"
                  " • Using setState in AnimationController listener causes unnecessary rebuilds\n"
                  " • Manual creation and update of opacity Tween animation\n"
                  " • Using Opacity widget instead of more efficient FadeTransition\n"
                  " • Rebuilding the entire widget tree on every animation frame\n" 
                  " • Inefficient handling of opacity transitions\n"
                  " • Manual management of AnimationController lifecycle\n"
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