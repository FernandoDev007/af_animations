import 'package:af_animations/af_animations.dart';
import 'package:flutter/material.dart';

class AfAnimatedColorPageOptimized extends StatefulWidget {
  const AfAnimatedColorPageOptimized({
    super.key,
  });

  @override
  State<AfAnimatedColorPageOptimized> createState() => _AfAnimatedColorPageOptimizedState();
}

class _AfAnimatedColorPageOptimizedState extends State<AfAnimatedColorPageOptimized> {

  Color currentColor = Colors.blue;
  
  List<Color> availableColors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.purple,
    Colors.orange,
  ];
  
  int colorIndex = 0;

  void _changeColor() {
    colorIndex = (colorIndex + 1) % availableColors.length;
    currentColor = availableColors[colorIndex];
    AfAnimations.update(context, ids: ["AfAnimatedColor Demo"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: AppBar(
          title: const Padding(
            padding: EdgeInsets.all(3.0),
            child: Text(" AfAnimatedColor Demo "),
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
                  " Using AfAnimatedColor, smooth color transitions can be applied with optimal performance. ",
                  textAlign: TextAlign.center,
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 20).afShowRepaint(context),

              GestureDetector(
                onTap: _changeColor,
                child: AfAnimatedColor(
                  id: "AfAnimatedColor Demo",
                  color: () => currentColor,
                  builder: (context, color, child) {
                    return Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: color.withValues(alpha: 0.5),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: child,
                    ).afShowRepaint(context);
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: const Text(
                        "Tap to change color",
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

              const SizedBox(height: 20).afShowRepaint(context),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: _changeColor,
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(" Animate Color "),
                  ).afShowRepaint(context),
                ),
              ).afShowRepaint(context),

              const SizedBox(height: 20).afShowRepaint(context),

              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  " AfAnimatedColor uses implicit animations with ColorTween for smooth color transitions without rebuilding the entire widget tree. ",
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