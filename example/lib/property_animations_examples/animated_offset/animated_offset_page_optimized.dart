import 'package:af_animations/af_animations.dart';
import 'package:flutter/material.dart';

class AfAnimatedOffsetPageOptimized extends StatefulWidget {
  const AfAnimatedOffsetPageOptimized({
    super.key,
  });

  @override
  State<AfAnimatedOffsetPageOptimized> createState() => _AfAnimatedOffsetPageOptimizedState();
}

class _AfAnimatedOffsetPageOptimizedState extends State<AfAnimatedOffsetPageOptimized> {

  Offset currentOffset = Offset.zero;
  int currentPosition = 0;
  
  final List<Offset> positions = [
    Offset.zero,         // Center
    const Offset(50, -30),   // Top-right
    const Offset(50, 30),    // Bottom-right
    const Offset(-50, 30),   // Bottom-left
    const Offset(-50, -30),  // Top-left
  ];

  void _toggleOffset() {
    currentPosition = (currentPosition + 1) % positions.length;
    currentOffset = positions[currentPosition];
    AfAnimations.update(context, ids: ["AfAnimatedOffset Demo"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: AppBar(
          title: const Padding(
            padding: EdgeInsets.all(3.0),
            child: Text(" AfAnimatedOffset Demo "),
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
                  " Using AfAnimatedOffset, smooth position transitions can be applied with optimal performance using Transform.translate. ",
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
                    child: AfAnimatedOffset(
                      id: "AfAnimatedOffset Demo",
                      offset: () => currentOffset,
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
                      ),
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
                  " AfAnimatedOffset provides smooth position transitions using Transform.translate, perfect for moving widgets without affecting layout performance. ",
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