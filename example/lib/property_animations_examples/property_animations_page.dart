import 'package:af_animations_example/select_example_type.dart';
import 'package:flutter/material.dart';


class PropertyAnimationsPage extends StatefulWidget {
  const PropertyAnimationsPage({
    super.key,
  });

  @override
  State<PropertyAnimationsPage> createState() => _PropertyAnimationsPageState();
}

class _PropertyAnimationsPageState extends State<PropertyAnimationsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: AppBar(
          title: const Text('Property Animations'),
          centerTitle: true,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 30),
        
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SelectExampleTypePage(
                          title: "AfAnimatedValue Demo",
                          description: "Animating a single value by interpolating to the new value, "
                            "a very dynamic animation.",
                          titleUnoptimizeVersion: "Without using AfAnimatedValue",
                          onTapUnoptimizeVersion: () {
                            Navigator.of(context).pushNamed("/animated_value_page_unoptimized");
                          },
                          titleOptimizeVersion: "Using AfAnimatedValue",
                          onTapOptimizedVersion: () {
                            Navigator.of(context).pushNamed("/animated_value_page_optimized");
                          },
                        ))
                      );
                    },
                    child: const Text("AfAnimatedValue", textAlign: TextAlign.center)
                  ),
                ),
        
                const SizedBox(height: 15),
        
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SelectExampleTypePage(
                            title: "AfAnimatedSec. Demo",
                            description: "Animates two values independently by interpolating towards the new value,"
                              " a very dynamic animation",
                            titleUnoptimizeVersion: "Without using AfAnimatedSecondaryValue",
                            onTapUnoptimizeVersion: () {
                              Navigator.of(context).pushNamed("/animated_secondary_value_page_unoptimized");
                            },
                            titleOptimizeVersion: "Using AfAnimatedSecondaryValue",
                            onTapOptimizedVersion: () {
                              Navigator.of(context).pushNamed("/animated_secondary_value_page_optimized");
                            },
                          )
                        )
                      );
                    },
                    child: const Text("AfAnimatedSecondaryValue", textAlign: TextAlign.center)
                  ),
                ),
        
                const SizedBox(height: 15),
        
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SelectExampleTypePage(
                            title: "AfAnimatedComposed Demo",
                            description: "Combines multiple values into a single animation by interpolating each value independently,"
                              " the most powerful and flexible animation widget",
                            titleOptimizeVersion: "Using AfAnimatedComposed",
                            onTapOptimizedVersion: () {
                              Navigator.of(context).pushNamed("/animated_composed_page_optimized");
                            },
                            titleUnoptimizeVersion: "Without using AfAnimatedComposed",
                            onTapUnoptimizeVersion: () {
                              Navigator.of(context).pushNamed("/animated_composed_page_unoptimized");
                            },
                          )
                        )
                      );
                    },
                    child: const Text("AfAnimatedComposed", textAlign: TextAlign.center)
                  ),
                ),
        
                const SizedBox(height: 15),
        
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SelectExampleTypePage(
                            title: "AfAnimatedColor Demo",
                            description: "Animating a color value by interpolating to the new color, "
                              "perfect for smooth transitions of background colors, text colors, or borders",
                            titleUnoptimizeVersion: "Without using AfAnimatedColor",
                            onTapUnoptimizeVersion: () {
                              Navigator.of(context).pushNamed("/animated_color_page_unoptimized");
                            },
                            titleOptimizeVersion: "Using AfAnimatedColor",
                            onTapOptimizedVersion: () {
                              Navigator.of(context).pushNamed("/animated_color_page_optimized");
                            },
                          )
                        )
                      );
                    },
                    child: const Text("AfAnimatedColor", textAlign: TextAlign.center)
                  ),
                ),
        
                const SizedBox(height: 15),
        
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const ElevatedButton(
                    onPressed: null, ///In progress
                    child: Text("AfAnimatedOpacity", textAlign: TextAlign.center)
                  ),
                ),
        
                const SizedBox(height: 15),
        
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const ElevatedButton(
                    onPressed: null, ///In progress
                    child: Text("AfAnimatedSize", textAlign: TextAlign.center)
                  ),
                ),
        
                const SizedBox(height: 15),
        
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const ElevatedButton(
                    onPressed: null, ///In progress
                    child: Text("AfAnimatedAlignment", textAlign: TextAlign.center)
                  ),
                ),
        
                const SizedBox(height: 15),
        
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const ElevatedButton(
                    onPressed: null, ///In progress
                    child: Text("AfAnimatedOffset", textAlign: TextAlign.center)
                  ),
                ),
        
                const SizedBox(height: 15),
        
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const ElevatedButton(
                    onPressed: null, ///In progress
                    child: Text("AfAnimatedRotation", textAlign: TextAlign.center)
                  ),
                ),
        
                const SizedBox(height: 15),
        
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const ElevatedButton(
                    onPressed: null, ///In progress
                    child: Text("AfAnimatedScale", textAlign: TextAlign.center)
                  ),
                ),
        
                const SizedBox(height: 15),
        
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const ElevatedButton(
                    onPressed: null, ///In progress
                    child: Text("AfAnimatedBoxDecoration", textAlign: TextAlign.center)
                  ),
                ),
        
                const SizedBox(height: 15),
        
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const ElevatedButton(
                    onPressed: null, ///In progress
                    child: Text("AfAnimatedBorder", textAlign: TextAlign.center)
                  ),
                ),
        
                const SizedBox(height: 15),
        
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const ElevatedButton(
                    onPressed: null, ///In progress
                    child: Text("AfAnimatedShadow", textAlign: TextAlign.center)
                  ),
                ),
        
                const SizedBox(height: 15),
        
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const ElevatedButton(
                    onPressed: null, ///In progress
                    child: Text("AfAnimatedGradient", textAlign: TextAlign.center)
                  ),
                ),
        
                const SizedBox(height: 30),
              ],
            ),
          )
        ),
      ),
    );
  }

}

