import 'dart:math';
import 'dart:ui';

import 'package:af_animations/af_animations.dart';
import 'package:flutter/material.dart';


class AfAnimatedSecondaryValuePageUnoptimized extends StatefulWidget {
  const AfAnimatedSecondaryValuePageUnoptimized({
    super.key,
  });

  @override
  State<AfAnimatedSecondaryValuePageUnoptimized> createState() => _AfAnimatedSecondaryValuePageUnoptimizedState();
}

class _AfAnimatedSecondaryValuePageUnoptimizedState extends State<AfAnimatedSecondaryValuePageUnoptimized> with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controller1;
  late Animation<double> animation;
  late Animation<double> animation1;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: AfAnimations.getDuration(context),
    );
    controller1 = AnimationController(
      vsync: this,
      duration: AfAnimations.getDuration(context),
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: AfAnimations.getCurve(context))
    );
    animation1 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller1, curve: AfAnimations.getCurve(context))
    );

    ///Here is the cause of this bad practice, it could be solved by using AnimatedBuilder,
    ///but the advantage of AfAnimations is that you don't have to think about this,
    ///you can create animations more easily and optimally
    controller.addListener(() {
      setState(() {});
    });
    controller1.addListener(() {
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
            child: Text(" AfAnimatedSec. Demo "),
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
                  " Without using AfAnimatedSecondaryValue, very poor animation practices are employed in this animation. ",
                  textAlign: TextAlign.center,
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 20).afShowRepaint(context),

              GestureDetector(
                onTap: () {
                  if (controller.status == AnimationStatus.completed ||
                      controller1.status == AnimationStatus.forward) {
                    controller.reverse().then((value) {
                      Future.delayed(const Duration(milliseconds: 400), () {
                        controller1.reverse();
                      });
                    });
                  } else {
                    controller.forward().then((value) {
                      Future.delayed(const Duration(milliseconds: 400), () {
                        controller1.forward();
                      });
                    });
                  }
                },
                child: Container(
                  height: lerpDouble(170, 270, animation.value),
                  width: lerpDouble(
                      170,
                      min(MediaQuery.of(context).size.width, 270),
                      animation.value),
                  color: Colors.red,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Transform.scale(
                          scale: animation1.value + 1,
                          child: const Text(
                            "Example content of the widget",
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ).afShowRepaint(context),
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

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: () {
                    if (controller1.status == AnimationStatus.completed) {
                      controller1.reverse();
                    } else {
                      controller1.forward();
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

