import 'dart:math';
import 'dart:ui';

import 'package:af_animations/af_animations.dart';
import 'package:flutter/material.dart';


class AfAnimatedValuePageUnoptimized extends StatefulWidget {
  const AfAnimatedValuePageUnoptimized({
    super.key,
  });

  @override
  State<AfAnimatedValuePageUnoptimized> createState() => _AfAnimatedValuePageUnoptimizedState();
}

class _AfAnimatedValuePageUnoptimizedState extends State<AfAnimatedValuePageUnoptimized> with TickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: AfAnimations.getDuration(context),
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: AfAnimations.getCurve(context))
    );

    ///Here is the cause of this bad practice, it could be solved by using AnimatedBuilder,
    ///but the advantage of AfAnimations is that you don't have to think about this,
    ///you can create animations more easily and optimally
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
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
                  " Without using AfAnimatedValue, very poor animation practices are employed in this animation. ",
                  textAlign: TextAlign.center,
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 20).afShowRepaint(context),

              GestureDetector(
                onTap: () {
                  if (controller.status == AnimationStatus.completed) {
                    controller.reverse();
                  } else {
                    controller.forward();
                  }
                },
                child: Container(
                  height: lerpDouble(170, 300, animation.value),
                  width: lerpDouble(230, min(MediaQuery.of(context).size.width, 270), animation.value),
                  color: Color.lerp(Colors.red, Colors.blue[700]!, animation.value),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Transform.rotate(
                            angle: lerpDouble(0, 360, animation.value)! * 0.0174532925199433,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Example",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14 + lerpDouble(0, 10, animation.value)!
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ).afShowRepaint(context),
                          ),

                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Example content of the widget",
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ).afShowRepaint(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 20).afShowRepaint(context),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.status == AnimationStatus.completed) {
                      controller.reverse();
                    } else {
                      controller.forward();
                    }
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

