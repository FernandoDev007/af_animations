import 'dart:math';
import 'dart:ui';

import 'package:af_animations/af_animations.dart';
import 'package:flutter/material.dart';


class AfAnimatedSecondaryValuePageOptimized extends StatefulWidget {
  const AfAnimatedSecondaryValuePageOptimized({
    super.key,
  });

  @override
  State<AfAnimatedSecondaryValuePageOptimized> createState() => _AfAnimatedSecondaryValuePageOptimizedState();
}

class _AfAnimatedSecondaryValuePageOptimizedState extends State<AfAnimatedSecondaryValuePageOptimized> with TickerProviderStateMixin {

  bool animateContainer = false;
  bool animateText = false;

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
                  animateContainer = !animateContainer;
                  AfAnimations.update(context, ids: ["AfAnimatedSecondaryValue Optimized Demo"]);
                  Future.delayed(const Duration(milliseconds: 500), () {
                    if (!animateContainer) {
                      animateText = false;
                    } else {
                      animateText = true;
                    }
                    AfAnimations.update(context, ids: ["AfAnimatedSecondaryValue Optimized Demo"]);
                  });
                },
                child: AfAnimatedSecondaryValue(
                  id: "AfAnimatedSecondaryValue Optimized Demo",
                  value: () => animateContainer ? 1.0 : 0.0,
                  secondaryValue: () => animateText ? 1.0 : 0.0,
                  builder: (context, value, secondaryValue, child) {
                    return Container(
                      height: lerpDouble(170, 270, value),
                      width: lerpDouble(
                          170,
                          min(MediaQuery.of(context).size.width, 270),
                          value),
                      color: Colors.red,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Transform.scale(
                              scale: secondaryValue + 1,
                              child: const Text(
                                "Example content of the widget",
                                style: TextStyle(color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ).afShowRepaint(context),
                        ),
                      ),
                    );
                  }
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 20).afShowRepaint(context),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: () {
                    animateContainer = !animateContainer;
                    AfAnimations.update(context, ids: ["AfAnimatedSecondaryValue Optimized Demo"]);
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
                    animateText = !animateText;
                    AfAnimations.update(context, ids: ["AfAnimatedSecondaryValue Optimized Demo"]);
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

