import 'dart:math';
import 'dart:ui';

import 'package:af_animations/af_animations.dart';
import 'package:flutter/material.dart';


class AfAnimatedValuePageOptimized extends StatefulWidget {
  const AfAnimatedValuePageOptimized({
    super.key,
  });

  @override
  State<AfAnimatedValuePageOptimized> createState() => _AfAnimatedValuePageOptimizedState();
}

class _AfAnimatedValuePageOptimizedState extends State<AfAnimatedValuePageOptimized> {

  bool animation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: AppBar(
          title: const Padding(
            padding: EdgeInsets.all(3.0),
            child: Text(" AfAnimatedValue Demo "),
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
                  " Using AfAnimatedValue ",
                  textAlign: TextAlign.center,
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 20).afShowRepaint(context),

              AfAnimatedValue(
                id: "AfAnimatedValue Optimized Demo",
                value: () => animation ? 1.0 : 0.0,
                builder: (context, value, child) {
                  return GestureDetector(
                    onTap: () {
                      animation = !animation;
                      AfAnimations.update(context, ids: ["AfAnimatedValue Optimized Demo"]);
                    },
                    child: Container(
                      height: lerpDouble(170, 300, value),
                      width: lerpDouble(230, min(MediaQuery.of(context).size.width, 270), value),
                      color: Color.lerp(Colors.red, Colors.blue[700]!, value),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Transform.rotate(
                                angle: lerpDouble(0, 360, value)! * 0.0174532925199433,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Example",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14 + lerpDouble(0, 10, value)!
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ).afShowRepaint(context),
                              ),

                              child,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ).afShowRepaint(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Example content of the widget",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ).afShowRepaint(context),
              ),

              const SizedBox(height: 20).afShowRepaint(context),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: () {
                    animation = !animation;
                    AfAnimations.update(context, ids: ["AfAnimatedValue Optimized Demo"]);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(" Animate "),
                  ).afShowRepaint(context),
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 20).afShowRepaint(context),

              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  " A color change is a widget rebuild, it may not seem like much, but in production applications, it's important to optimize everything. ",
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

