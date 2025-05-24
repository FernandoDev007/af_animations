import 'dart:ui';

import 'package:af_animations/af_animations.dart';
import 'package:af_animations_example/home_page.dart';
import 'package:af_animations_example/property_animations_examples/animated_color/animated_color_page_optimized.dart';
import 'package:af_animations_example/property_animations_examples/animated_color/animated_color_page_unoptimized.dart';
import 'package:af_animations_example/property_animations_examples/animated_composed/animated_composed_page_optimized.dart';
import 'package:af_animations_example/property_animations_examples/animated_composed/animated_composed_page_unoptimized.dart';
import 'package:af_animations_example/property_animations_examples/animated_offset/animated_offset_page_optimized.dart';
import 'package:af_animations_example/property_animations_examples/animated_offset/animated_offset_page_unoptimized.dart';
import 'package:af_animations_example/property_animations_examples/animated_opacity/animated_opacity_page_optimized.dart';
import 'package:af_animations_example/property_animations_examples/animated_opacity/animated_opacity_page_unoptimized.dart';
import 'package:af_animations_example/property_animations_examples/animated_secondary_value/animated_secondary_value_page_optimized.dart';
import 'package:af_animations_example/property_animations_examples/animated_size/animated_size_page_optimized.dart';
import 'package:af_animations_example/property_animations_examples/animated_size/animated_size_page_unoptimized.dart';
import 'package:af_animations_example/utility_widgets_examples/builder/builder_page_optimized.dart' as builder_pages;
import 'package:af_animations_example/utility_widgets_examples/builder/builder_page_unoptimized.dart' as builder_pages;
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return AfAnimations(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      showRepaint: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/home",
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.indigo,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
            iconTheme: IconThemeData(color: Colors.white),
          ),
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.indigo,
            backgroundColor: Colors.white,
            accentColor: Colors.blueAccent,
          ),
        ),
        routes: {
          "/home" : (context) => const HomePage(),

          /// Property Animations
          "/property_animations" : (context) => const PropertyAnimationsPage(),
          "/animated_value_page_optimized" : (context) => const AfAnimatedValuePageOptimized(),
          "/animated_value_page_unoptimized" : (context) => const AfAnimatedValuePageUnoptimized(),
          "/animated_secondary_value_page_optimized" : (context) => const AfAnimatedSecondaryValuePageOptimized(),
          "/animated_secondary_value_page_unoptimized" : (context) => const AfAnimatedSecondaryValuePageUnoptimized(),
          "/animated_composed_page_optimized" : (context) => const AfAnimatedComposedPageOptimized(),
          "/animated_composed_page_unoptimized" : (context) => const AfAnimatedComposedPageUnoptimized(),
          "/animated_color_page_optimized" : (context) => const AfAnimatedColorPageOptimized(),
          "/animated_color_page_unoptimized" : (context) => const AfAnimatedColorPageUnoptimized(),
          "/animated_opacity_page_optimized" : (context) => const AfAnimatedOpacityPageOptimized(),
          "/animated_opacity_page_unoptimized" : (context) => const AfAnimatedOpacityPageUnoptimized(),
          "/animated_size_page_optimized" : (context) => const AfAnimatedSizePageOptimized(),
          "/animated_size_page_unoptimized" : (context) => const AfAnimatedSizePageUnoptimized(),
          "/animated_offset_page_optimized" : (context) => const AfAnimatedOffsetPageOptimized(),
          "/animated_offset_page_unoptimized" : (context) => const AfAnimatedOffsetPageUnoptimized(),

          /// Layout Animations
          "/layout_animations" : (context) => const LayoutAnimationsPage(),
          "/animated_clip_rrect_page_optimized" : (context) => const AfAnimatedClipRRectPageOptimized(),
          "/animated_clip_rrect_page_unoptimized" : (context) => const AfAnimatedClipRRectPageUnoptimized(),

          /// Utility Widgets
          "/utility_widgets" : (context) => const UtilityWidgetsPage(),
          "/builder_page_optimized" : (context) => const builder_pages.AfBuilderPageOptimized(),
          "/builder_page_unoptimized" : (context) => const builder_pages.AfBuilderPageUnoptimized(),

          /// Effect Animations
          "/effect_animations" : (context) => const EffectAnimationsPage(),

          /// Transition Animations
          "/transition_animations" : (context) => const TransitionAnimationsPage(),

          /// Sequence Animations  
          "/sequence_animations" : (context) => const SequenceAnimationsPage(),
        },
        scrollBehavior: const ScrollBehavior().copyWith(
          dragDevices: PointerDeviceKind.values.toSet(),
          overscroll: false, scrollbars: false,
        ),
      ),
    );
  }
}
