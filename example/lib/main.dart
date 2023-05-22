import 'dart:ui';

import 'package:af_animations_example/implicitly_examples_demo/animated_clip_rrect_page_optimized.dart';
import 'package:af_animations_example/implicitly_examples_demo/animated_clip_rrect_page_unoptimized.dart';
import 'package:af_animations_example/implicitly_examples_demo/implicitly_page.dart';
import 'package:flutter/material.dart';

import 'package:af_animations/af_animations.dart';
import 'package:af_animations_example/home_page.dart';


void main() => runApp(const MyApp());


class MyApp extends StatefulWidget {

  const MyApp({
    super.key
  });

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
        routes: {
          "/home" : (context) => const HomePage(),


          "/implicitly_demo" : (context) => const ImplicitlyPage(),

          "/animated_clip_rrect_page_optimized" : (context) => const AfAnimatedClipRRectPageOptimized(),
          "/animated_clip_rrect_page_unoptimized" : (context) => const AfAnimatedClipRRectPageUnoptimized(),
        },
        scrollBehavior: const ScrollBehavior().copyWith(
          dragDevices: PointerDeviceKind.values.toSet(),
          overscroll: false, scrollbars: false,
        ),
      ),
    );
  }

}

