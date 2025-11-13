import 'dart:math';

import 'package:af_animations/af_animations.dart';
import 'package:flutter/material.dart';


class AfAnimatedComposedPageUnoptimized extends StatefulWidget {
  const AfAnimatedComposedPageUnoptimized({
    super.key,
  });

  @override
  State<AfAnimatedComposedPageUnoptimized> createState() => _AfAnimatedComposedPageUnoptimizedState();
}

class _AfAnimatedComposedPageUnoptimizedState extends State<AfAnimatedComposedPageUnoptimized> with TickerProviderStateMixin {
  // Independent controls for each animation
  double opacity = 0.3;
  double scale = 0.6;
  double rotation = 0.0;
  double offset = 0.0;

  // Individual animation controllers (bad practice)
  late AnimationController _opacityController;
  late Animation<double> _opacityAnimation;
  
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  
  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;
  
  late AnimationController _offsetController;
  late Animation<double> _offsetAnimation;

  // Flags to control animation state
  bool isAnimatingOpacity = false;
  bool isAnimatingScale = false;
  bool isAnimatingRotation = false;
  bool isAnimatingOffset = false;

  @override
  void initState() {
    super.initState();

    // Initialize a controller for each property (bad practice)
    _opacityController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _offsetController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Configure animations
    _opacityAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _opacityController, curve: Curves.easeInOut),
    )..addListener(() {
      // This causes multiple unnecessary rebuilds
      setState(() {
        opacity = _opacityAnimation.value;
      });
    });

    _scaleAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    )..addListener(() {
      setState(() {
        scale = _scaleAnimation.value;
      });
    });

    _rotationAnimation = Tween<double>(begin: 0.0, end: pi/4).animate(
      CurvedAnimation(parent: _rotationController, curve: Curves.easeInOutCubic),
    )..addListener(() {
      setState(() {
        rotation = _rotationAnimation.value;
      });
    });

    _offsetAnimation = Tween<double>(begin: 0.0, end: 50.0).animate(
      CurvedAnimation(parent: _offsetController, curve: Curves.easeOutBack),
    )..addListener(() {
      setState(() {
        offset = _offsetAnimation.value;
      });
    });
  }

  @override
  void dispose() {
    _opacityController.dispose();
    _scaleController.dispose();
    _rotationController.dispose();
    _offsetController.dispose();
    super.dispose();
  }

  // Methods to control animations individually
  void _toggleOpacity() {
    setState(() {
      isAnimatingOpacity = !isAnimatingOpacity;
      if (isAnimatingOpacity) {
        _opacityController.forward();
      } else {
        _opacityController.reverse();
      }
    });
  }

  void _toggleScale() {
    setState(() {
      isAnimatingScale = !isAnimatingScale;
      if (isAnimatingScale) {
        _scaleController.forward();
      } else {
        _scaleController.reverse();
      }
    });
  }

  void _toggleRotation() {
    setState(() {
      isAnimatingRotation = !isAnimatingRotation;
      if (isAnimatingRotation) {
        _rotationController.forward();
      } else {
        _rotationController.reverse();
      }
    });
  }

  void _toggleOffset() {
    setState(() {
      isAnimatingOffset = !isAnimatingOffset;
      if (isAnimatingOffset) {
        _offsetController.forward();
      } else {
        _offsetController.reverse();
      }
    });
  }

  // Method to animate everything at once (still using separate controllers)
  void _toggleAll() {
    setState(() {
      final bool newState = !(isAnimatingOpacity && isAnimatingScale && 
          isAnimatingRotation && isAnimatingOffset);
      
      isAnimatingOpacity = newState;
      isAnimatingScale = newState;
      isAnimatingRotation = newState;
      isAnimatingOffset = newState;
      
      if (newState) {
        _opacityController.forward();
        _scaleController.forward();
        _rotationController.forward();
        _offsetController.forward();
      } else {
        _opacityController.reverse();
        _scaleController.reverse();
        _rotationController.reverse();
        _offsetController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: AppBar(
          title: const Padding(
            padding: EdgeInsets.all(3.0),
            child: Text(" Without AfAnimatedComposed Demo "),
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
                  " Without using AfAnimatedComposed, each animation needs its own controller and causes multiple rebuilds. ",
                  textAlign: TextAlign.center,
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 20).afShowRepaint(context),

              // Widget that animates with multiple controllers and properties
              GestureDetector(
                onTap: _toggleAll,
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: Transform.rotate(
                      angle: rotation,
                      child: Transform.translate(
                        offset: Offset(0, offset),
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: const Text(
                                "Multiple controllers!\n(bad practice)",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ).afShowRepaint(context),
                            ),
                          ),
                        ).afShowRepaint(context),
                      ),
                    ),
                  ),
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 20).afShowRepaint(context),

              // Individual controls for each animated property
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: _toggleOpacity,
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(
                      " Animate Opacity "
                    ),
                  ).afShowRepaint(context),
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 10).afShowRepaint(context),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: _toggleScale,
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(
                      " Animate Scale "
                    ),
                  ).afShowRepaint(context),
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 10).afShowRepaint(context),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: _toggleRotation,
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(
                      " Animate Rotation "
                    ),
                  ).afShowRepaint(context),
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 10).afShowRepaint(context),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: _toggleOffset,
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(
                      " Animate Offset "
                    ),
                  ).afShowRepaint(context),
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 20).afShowRepaint(context),

              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  " Problems with this implementation:\n"
                  " • Multiple animation controllers\n"
                  " • Multiple setState calls inside listeners\n"
                  " • Higher memory consumption\n"
                  " • Verbose code prone to errors\n"
                  " • Complete widget rebuilding on each frame",
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