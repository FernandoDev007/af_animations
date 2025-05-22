import 'dart:math';

import 'package:af_animations/af_animations.dart';
import 'package:flutter/material.dart';


class AfAnimatedComposedPageOptimized extends StatefulWidget {
  const AfAnimatedComposedPageOptimized({
    super.key,
  });

  @override
  State<AfAnimatedComposedPageOptimized> createState() => _AfAnimatedComposedPageOptimizedState();
}

class _AfAnimatedComposedPageOptimizedState extends State<AfAnimatedComposedPageOptimized> {

  // Controles independientes para cada animación
  bool animateOpacity = false;
  bool animateScale = false;
  bool animateRotation = false;
  bool animateOffset = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: AppBar(
          title: const Padding(
            padding: EdgeInsets.all(3.0),
            child: Text(" AfAnimatedComposed Demo "),
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
                  " Using AfAnimatedComposed, multiple values can be animated independently but in sync. ",
                  textAlign: TextAlign.center,
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 20).afShowRepaint(context),

              GestureDetector(
                onTap: () {
                  // Invertir todos los estados de animación
                  animateOpacity = !animateOpacity;
                  animateScale = !animateScale;
                  animateRotation = !animateRotation;
                  animateOffset = !animateOffset;
                  AfAnimations.update(context, ids: ["AfAnimatedComposed Demo"]);
                },
                child: AfAnimatedComposed(
                  id: "AfAnimatedComposed Demo",
                  // Animated values: cada uno con su propio control
                  values: [
                    () => animateOpacity ? 1.0 : 0.3,   // opacity
                    () => animateScale ? 1.0 : 0.6,     // scale
                    () => animateRotation ? pi/4 : 0.0, // rotation
                    () => animateOffset ? 50.0 : 0.0,   // offset
                  ],
                  // Optional different curves for each value
                  curves: const [
                    Curves.easeInOut,                    // opacity: smooth
                    Curves.elasticOut,                   // scale: bouncy
                    Curves.easeInOutCubic,               // rotation: smooth accel/decel
                    Curves.easeOutBack,                  // offset: slight overshoot
                  ],
                  duration: const Duration(milliseconds: 800),
                  builder: (context, values, child) {
                    return Opacity(
                      opacity: values[0],
                      child: Transform.scale(
                        scale: values[1],
                        child: Transform.rotate(
                          angle: values[2],
                          child: Transform.translate(
                            offset: Offset(0, values[3]),
                            child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.blue,
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
                                    "Multiple animations in one!",
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
                    );
                  }
                ),
              ),

              const SizedBox(height: 20).afShowRepaint(context),

              // Controles individuales para cada propiedad animada
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: () {
                    animateOpacity = !animateOpacity;
                    AfAnimations.update(context, ids: ["AfAnimatedComposed Demo"]);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(" Animate Opacity "),
                  ).afShowRepaint(context),
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 10).afShowRepaint(context),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: () {
                    animateScale = !animateScale;
                    AfAnimations.update(context, ids: ["AfAnimatedComposed Demo"]);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(" Animate Scale "),
                  ).afShowRepaint(context),
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 10).afShowRepaint(context),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: () {
                    animateRotation = !animateRotation;
                    AfAnimations.update(context, ids: ["AfAnimatedComposed Demo"]);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(" Animate Rotation "),
                  ).afShowRepaint(context),
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 10).afShowRepaint(context),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: () {
                    animateOffset = !animateOffset;
                    AfAnimations.update(context, ids: ["AfAnimatedComposed Demo"]);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(" Animate Offset "),
                  ).afShowRepaint(context),
                ),
              ).afShowRepaint(context),

              //const SizedBox(height: 20).afShowRepaint(context),

              //SizedBox(
              //  width: MediaQuery.of(context).size.width * 0.6,
              //  child: ElevatedButton(
              //    onPressed: () {
              //      animateOpacity = !animateOpacity;
              //      animateScale = !animateScale;
              //      animateRotation = !animateRotation;
              //      animateOffset = !animateOffset;
              //      AfAnimations.update(context, ids: ["AfAnimatedComposed Demo"]);
              //    },
              //    child: const Padding(
              //      padding: EdgeInsets.all(3.0),
              //      child: Text(
              //        "Animated all"
              //      ),
              //    ).afShowRepaint(context),
              //  ),
              //).afShowRepaint(context),

              const SizedBox(height: 20).afShowRepaint(context),

              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  " AfAnimatedComposed allows complex animations to be composed with minimal code and optimal performance. ",
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