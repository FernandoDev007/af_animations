import 'package:flutter/material.dart';

import 'package:af_animations/af_animations.dart';


class AfAnimatedClipRRectPageUnoptimized extends StatefulWidget {
  const AfAnimatedClipRRectPageUnoptimized({
    super.key,
  });

  @override
  State<AfAnimatedClipRRectPageUnoptimized> createState() => _AfAnimatedClipRRectPageUnoptimizedState();
}

class _AfAnimatedClipRRectPageUnoptimizedState extends State<AfAnimatedClipRRectPageUnoptimized> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: AfAnimations.getDuration(context),
    );
    animation = Tween<double>(begin: 30.0, end: 80.0).animate(
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
          title: const Text(' AfAnimatedClipRRect Demo ').showRepaint(context),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back),
          ).showRepaint(context),
        ).showRepaint(context),
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
                  " Without using AfAnimatedClipRRect, very poor animation practices are employed in this animation. ",
                  textAlign: TextAlign.center,
                ),
              ).showRepaint(context),

              const SizedBox(height: 20).showRepaint(context),

              ClipRRect(
                borderRadius: BorderRadius.circular(animation.value),
                child: GestureDetector(
                  onTap: () {
                    if (controller.status == AnimationStatus.forward) {
                      controller.reverse();
                    } else {
                      controller.forward();
                    }
                  },
                  child: Container(
                    height: 170,
                    width: 170,
                    color: Colors.red,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Example content of the widget",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ).showRepaint(context),
                      ),
                    ),
                  ),
                ),
              ).showRepaint(context),

              const SizedBox(height: 20).showRepaint(context),

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
                  child: const Text("  Animate  ").showRepaint(context),
                ),
              ).showRepaint(context),

              const SizedBox(height: 20).showRepaint(context),

              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  " A color change is a widget rebuild, it may not seem like much, but in production applications, it's important to optimize everything. ",
                  textAlign: TextAlign.center,
                  textScaleFactor: 0.75,
                ),
              ).showRepaint(context),
            ],
          ).showRepaint(context),
        ),
      ).showRepaint(context),
    );
  }

}

