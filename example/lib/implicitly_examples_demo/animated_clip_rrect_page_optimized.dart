import 'package:af_animations/af_animations.dart';
import 'package:flutter/material.dart';


class AfAnimatedClipRRectPageOptimized extends StatefulWidget {
  const AfAnimatedClipRRectPageOptimized({
    super.key,
  });

  @override
  State<AfAnimatedClipRRectPageOptimized> createState() => _AfAnimatedClipRRectPageOptimizedState();
}

class _AfAnimatedClipRRectPageOptimizedState extends State<AfAnimatedClipRRectPageOptimized> {

  double value = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: AppBar(
          title: const Text(' AfAnimatedClipRRect Demo ').afShowRepaint(context),
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
                child: Text(" Using AfAnimatedClipRRect "),
              ).afShowRepaint(context),

              const SizedBox(height: 20).afShowRepaint(context),

              AfAnimatedClipRRect(
                /// Or controller: controller,
                id: "AfAnimatedClipRRect Optimized Demo",
                borderRadius: () => BorderRadius.circular(value),
                child: GestureDetector(
                  onTap: () {
                    if (value == 80) {
                      value = 30;
                    } else {
                      value = 80;
                    }
                    AfAnimations.update(context, ids: ["AfAnimatedClipRRect Optimized Demo"]);
                    /// Or controller.update(ids: ["AfAnimatedClipRRect Optimized Demo"]);
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
                        ).afShowRepaint(context),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20).afShowRepaint(context),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: () {
                    if (value == 80) {
                      value = 30;
                    } else {
                      value = 80;
                    }
                    AfAnimations.update(context, ids: ["AfAnimatedClipRRect Optimized Demo"]);
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
        )
      ).afShowRepaint(context),
    );
  }

}

