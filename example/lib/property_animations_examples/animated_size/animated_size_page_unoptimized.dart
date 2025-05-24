import 'package:af_animations/af_animations.dart';
import 'package:flutter/material.dart';

class AfAnimatedSizePageUnoptimized extends StatefulWidget {
  const AfAnimatedSizePageUnoptimized({
    super.key,
  });

  @override
  State<AfAnimatedSizePageUnoptimized> createState() => _AfAnimatedSizePageUnoptimizedState();
}

class _AfAnimatedSizePageUnoptimizedState extends State<AfAnimatedSizePageUnoptimized> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<Size?> sizeAnimation;
  
  Size currentSize = const Size(150, 150);
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    
    _updateSizeAnimation();

    // Bad practice: Using setState in the animation listener
    // causes the entire widget tree to rebuild on every frame
    controller.addListener(() {
      setState(() {
        // This forces a rebuild of the entire widget tree
        // instead of just updating the size
      });
    });
  }

  void _updateSizeAnimation() {
    sizeAnimation = SizeTween(
      begin: currentSize,
      end: isExpanded ? const Size(250, 300) : const Size(150, 150),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  void _toggleSize() {
    // Update the target size manually
    isExpanded = !isExpanded;
    currentSize = sizeAnimation.value ?? currentSize;
    
    // Recreate the animation with new size values
    _updateSizeAnimation();
    
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
    final Size animatedSize = sizeAnimation.value ?? currentSize;
    
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: AppBar(
          title: const Padding(
            padding: EdgeInsets.all(3.0),
            child: Text(" Without AfAnimatedSize Demo "),
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
                  " Without using AfAnimatedSize, poor animation practices are employed in this size animation. ",
                  textAlign: TextAlign.center,
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 30).afShowRepaint(context),

              GestureDetector(
                onTap: _toggleSize,
                child: Center(
                  child: SizedBox(
                    width: animatedSize.width,
                    height: animatedSize.height,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: const Text(
                          "Animated Size",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ).afShowRepaint(context).afShowRepaint(context),
                      ),
                    ).afShowRepaint(context),
                  ),
                ),
              ),

              const SizedBox(height: 30).afShowRepaint(context),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: _toggleSize,
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(" Animate Size "),
                  ).afShowRepaint(context),
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 10).afShowRepaint(context),

              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  " Problems with this implementation:\n"
                  " • Using setState in AnimationController listener causes unnecessary rebuilds\n"
                  " • Manual creation and update of SizeTween animation\n"
                  " • Rebuilding the entire widget tree on every animation frame\n" 
                  " • Inefficient handling of size transitions\n"
                  " • Manual management of AnimationController lifecycle\n"
                  " • Complex state management for size values\n"
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