import 'package:af_animations/af_animations.dart';
import 'package:flutter/material.dart';

class AfAnimatedOpacityPageOptimized extends StatefulWidget {
  const AfAnimatedOpacityPageOptimized({
    super.key,
  });

  @override
  State<AfAnimatedOpacityPageOptimized> createState() => _AfAnimatedOpacityPageOptimizedState();
}

class _AfAnimatedOpacityPageOptimizedState extends State<AfAnimatedOpacityPageOptimized> {

  double currentOpacity = 1.0;
  bool isVisible = true;

  void _toggleOpacity() {
    isVisible = !isVisible;
    currentOpacity = isVisible ? 1.0 : 0.2;
    AfAnimations.update(context, ids: ["AfAnimatedOpacity Demo"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: AppBar(
          title: const Padding(
            padding: EdgeInsets.all(3.0),
            child: Text(" AfAnimatedOpacity Demo "),
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
                  " Using AfAnimatedOpacity, smooth opacity transitions can be applied with optimal performance using FadeTransition internally. ",
                  textAlign: TextAlign.center,
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 20).afShowRepaint(context),

              GestureDetector(
                onTap: _toggleOpacity,
                child: Center(
                  child: AfAnimatedOpacity(
                    id: "AfAnimatedOpacity Demo",
                    opacity: () => currentOpacity,
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
                ),
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
                  " AfAnimatedOpacity uses FadeTransition internally for optimal performance, providing smooth opacity transitions without rebuilding the entire widget tree. ",
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