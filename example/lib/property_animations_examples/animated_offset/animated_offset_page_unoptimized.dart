import 'package:af_animations/af_animations.dart';
import 'package:flutter/material.dart';

class AfAnimatedOffsetPageUnoptimized extends StatefulWidget {
  const AfAnimatedOffsetPageUnoptimized({
    super.key,
  });

  @override
  State<AfAnimatedOffsetPageUnoptimized> createState() => _AfAnimatedOffsetPageUnoptimizedState();
}

class _AfAnimatedOffsetPageUnoptimizedState extends State<AfAnimatedOffsetPageUnoptimized> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<Offset> offsetAnimation;
  
  Offset currentOffset = Offset.zero;
  int currentPosition = 0;
  
  final List<Offset> positions = [
    Offset.zero,         // Center
    const Offset(50, -30),   // Top-right
    const Offset(50, 30),    // Bottom-right
    const Offset(-50, 30),   // Bottom-left
    const Offset(-50, -30),  // Top-left
  ];

  @override
  void initState() {
    super.initState();
    
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    
    _updateOffsetAnimation();

    // Bad practice: Using setState in the animation listener
    // causes the entire widget tree to rebuild on every frame
    controller.addListener(() {
      setState(() {
        // This forces a rebuild of the entire widget tree
        // instead of just updating the offset
      });
    });
  }

  void _updateOffsetAnimation() {
    offsetAnimation = Tween<Offset>(
      begin: currentOffset,
      end: positions[currentPosition],
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  void _toggleOffset() {
    // Update the target offset manually
    currentPosition = (currentPosition + 1) % positions.length;
    currentOffset = offsetAnimation.value;
    
    // Recreate the animation with new offset values
    _updateOffsetAnimation();
    
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
    final Offset animatedOffset = offsetAnimation.value;
    
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: AppBar(
          title: const Padding(
            padding: EdgeInsets.all(3.0),
            child: Text(" Without AfAnimatedOffset Demo "),
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
                  " Without using AfAnimatedOffset, poor animation practices are employed in this position animation. ",
                  textAlign: TextAlign.center,
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 30).afShowRepaint(context),

              GestureDetector(
                onTap: _toggleOffset,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Transform.translate(
                      offset: animatedOffset,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(20),
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
                  onPressed: _toggleOffset,
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(" Animate Offset "),
                  ).afShowRepaint(context),
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 10).afShowRepaint(context),

              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  " Problems with this implementation:\n"
                  " • Using setState in AnimationController listener causes unnecessary rebuilds\n"
                  " • Manual creation and update of Offset Tween animation\n"
                  " • Rebuilding the entire widget tree on every animation frame\n" 
                  " • Inefficient handling of position transitions\n"
                  " • Manual management of AnimationController lifecycle\n"
                  " • Complex state management for offset values\n"
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