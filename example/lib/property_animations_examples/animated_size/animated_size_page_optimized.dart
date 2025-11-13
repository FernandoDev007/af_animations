import 'package:af_animations/af_animations.dart';
import 'package:flutter/material.dart';

class AfAnimatedSizePageOptimized extends StatefulWidget {
  const AfAnimatedSizePageOptimized({
    super.key,
  });

  @override
  State<AfAnimatedSizePageOptimized> createState() => _AfAnimatedSizePageOptimizedState();
}

class _AfAnimatedSizePageOptimizedState extends State<AfAnimatedSizePageOptimized> {

  Size currentSize = const Size(150, 150);
  bool isExpanded = false;

  void _toggleSize() {
    isExpanded = !isExpanded;
    currentSize = isExpanded ? const Size(250, 300) : const Size(150, 150);
    AfAnimations.update(context, ids: ["AfAnimatedSize Demo"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: AppBar(
          title: const Padding(
            padding: EdgeInsets.all(3.0),
            child: Text(" AfAnimatedSize Demo "),
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
                  " Using AfAnimatedSize, smooth width and height transitions can be applied with optimal performance. ",
                  textAlign: TextAlign.center,
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 30).afShowRepaint(context),

              GestureDetector(
                onTap: _toggleSize,
                child: Center(
                  child: AfAnimatedSize(
                    id: "AfAnimatedSize Demo",
                    size: () => currentSize,
                    alignment: Alignment.center,
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
                  " AfAnimatedSize provides smooth transitions for width and height changes, making it perfect for resizing containers with optimal performance. ",
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