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
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SelectExampleTypePage(
                            title: "AfAnimatedOpacity Demo",
                            description: "Animating opacity value by interpolating to the new opacity, "
                              "providing optimal performance using FadeTransition internally",
                            titleUnoptimizeVersion: "Without using AfAnimatedOpacity",
                            onTapUnoptimizeVersion: () {
                              Navigator.of(context).pushNamed("/animated_opacity_page_unoptimized");
                            },
                            titleOptimizeVersion: "Using AfAnimatedOpacity",
                            onTapOptimizedVersion: () {
                              Navigator.of(context).pushNamed("/animated_opacity_page_optimized");
                            },
                          )
                        )
                      );
                    },
                    child: const Text("AfAnimatedOpacity", textAlign: TextAlign.center)
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
                            title: "AfAnimatedSize Demo",
                            description: "Animating width and height values by interpolating to the new size, "
                              "providing smooth transitions for resizing containers, images, or any widget",
                            titleUnoptimizeVersion: "Without using AfAnimatedSize",
                            onTapUnoptimizeVersion: () {
                              Navigator.of(context).pushNamed("/animated_size_page_unoptimized");
                            },
                            titleOptimizeVersion: "Using AfAnimatedSize",
                            onTapOptimizedVersion: () {
                              Navigator.of(context).pushNamed("/animated_size_page_optimized");
                            },
                          )
                        )
                      );
                    },
                    child: const Text("AfAnimatedSize", textAlign: TextAlign.center)
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
                            title: "AfAnimatedOffset Demo",
                            description: "Animating position values by interpolating to the new offset, "
                              "providing smooth position transitions using Transform.translate without affecting layout",
                            titleUnoptimizeVersion: "Without using AfAnimatedOffset",
                            onTapUnoptimizeVersion: () {
                              Navigator.of(context).pushNamed("/animated_offset_page_unoptimized");
                            },
                            titleOptimizeVersion: "Using AfAnimatedOffset",
                            onTapOptimizedVersion: () {
                              Navigator.of(context).pushNamed("/animated_offset_page_optimized");
                            },
                          )
                        )
                      );
                    },
                    child: const Text("AfAnimatedOffset", textAlign: TextAlign.center)
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
                            title: "AfAnimatedRotation Demo",
                            description: "Animating rotation angles by interpolating to the new angle value, "
                              "providing smooth rotation transitions using Transform.rotate without affecting layout",
                            titleUnoptimizeVersion: "Without using AfAnimatedRotation",
                            onTapUnoptimizeVersion: () {
                              Navigator.of(context).pushNamed("/animated_rotation_page_unoptimized");
                            },
                            titleOptimizeVersion: "Using AfAnimatedRotation",
                            onTapOptimizedVersion: () {
                              Navigator.of(context).pushNamed("/animated_rotation_page_optimized");
                            },
                          )
                        )
                      );
                    },
                    child: const Text("AfAnimatedRotation", textAlign: TextAlign.center)
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
                            title: "AfAnimatedScale Demo",
                            description: "Animating scale values by interpolating to the new scale factor, "
                              "providing smooth zoom and scaling transitions using Transform.scale without affecting layout",
                            titleUnoptimizeVersion: "Without using AfAnimatedScale",
                            onTapUnoptimizeVersion: () {
                              Navigator.of(context).pushNamed("/animated_scale_page_unoptimized");
                            },
                            titleOptimizeVersion: "Using AfAnimatedScale",
                            onTapOptimizedVersion: () {
                              Navigator.of(context).pushNamed("/animated_scale_page_optimized");
                            },
                          )
                        )
                      );
                    },
                    child: const Text("AfAnimatedScale", textAlign: TextAlign.center)
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
                            title: "AfAnimatedBoxDecoration Demo",
                            description: "Animating BoxDecoration properties by interpolating to the new decoration, "
                              "providing smooth transitions for colors, gradients, borders, shadows, and border radius using DecorationTween",
                            titleUnoptimizeVersion: "Without using AfAnimatedBoxDecoration",
                            onTapUnoptimizeVersion: () {
                              Navigator.of(context).pushNamed("/animated_box_decoration_page_unoptimized");
                            },
                            titleOptimizeVersion: "Using AfAnimatedBoxDecoration",
                            onTapOptimizedVersion: () {
                              Navigator.of(context).pushNamed("/animated_box_decoration_page_optimized");
                            },
                          )
                        )
                      );
                    },
                    child: const Text("AfAnimatedBoxDecoration", textAlign: TextAlign.center)
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

