import 'dart:ui';

import 'package:af_animations/af_animations.dart';
import 'package:af_animations_example/home_page.dart';
import 'package:af_animations_example/value_examples_demo/animated_secondary_value_page_optimized.dart';
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

          /// Value Animations
          "/value_demo" : (context) => const ValuePage(),
          "/animated_value_page_optimized" : (context) => const AfAnimatedValuePageOptimized(),
          "/animated_value_page_unoptimized" : (context) => const AfAnimatedValuePageUnoptimized(),
          "/animated_secondary_value_page_optimized" : (context) => const AfAnimatedSecondaryValuePageOptimized(),
          "/animated_secondary_value_page_unoptimized" : (context) => const AfAnimatedSecondaryValuePageUnoptimized(),

          /// Implicitly Animations
          "/implicitly_demo" : (context) => const ImplicitlyPage(),
          "/animated_clip_rrect_page_optimized" : (context) => const AfAnimatedClipRRectPageOptimized(),
          "/animated_clip_rrect_page_unoptimized" : (context) => const AfAnimatedClipRRectPageUnoptimized(),

          /// Other widgets
          "/other_widgets_demo" : (context) => const OtherWidgetsPage(),
          "/builder_page_optimized" : (context) => const AfBuilderPageOptimized(),
          "/builder_page_unoptimized" : (context) => const AfBuilderPageUnoptimized(),
        },
        scrollBehavior: const ScrollBehavior().copyWith(
          dragDevices: PointerDeviceKind.values.toSet(),
          overscroll: false, scrollbars: false,
        ),
      ),
    );
  }
}
