import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

part 'implicitly/animated_clip_rrect.dart';
part 'extensions/af_widgets_extension.dart';
part 'af_animations_widgets_state.dart';


class AfAnimations extends StatefulWidget {

  final Widget child;
  final Duration? duration;
  final Curve? curve;
  final void Function()? onEnd;
  final bool showRepaint;

  const AfAnimations({
    super.key,
    required this.child,
    this.duration,
    this.curve,
    this.onEnd,
    this.showRepaint = false,
  });


  static String get _getIdentifier => "K${UniqueKey()}D${DateTime.now().millisecondsSinceEpoch}";
  static Duration get _defaultDuration => const Duration(milliseconds: 300);
  static Curve get _defaultCurve => Curves.easeInOut;

  static bool existsAncestor(BuildContext context) {
    return context.findAncestorWidgetOfExactType<AfAnimations>() != null;
  }

  static Duration getDuration(BuildContext context) {
    return context.findAncestorWidgetOfExactType<AfAnimations>()?.duration
      ?? AfAnimations._defaultDuration;
  }

  static Curve getCurve(BuildContext context) {
    return context.findAncestorWidgetOfExactType<AfAnimations>()?.curve
      ?? AfAnimations._defaultCurve;
  }

  static void callOnEnd(BuildContext context) {
    context.findAncestorWidgetOfExactType<AfAnimations>()?.onEnd?.call();
  }

  static void update(BuildContext context, {List<String> ids = const <String>[""]}) {
    if (!existsAncestor(context)) {
      throw FlutterError("SfAnimations Error - No ancestor was found, wrap MaterialApp or another parent (As Scaffold) with AfAnimations");
    }

    context.findAncestorStateOfType<_AfAnimationsState>()!._afAnimationsWidgetsStates.where(
      (animationState) => ids.any((id) => animationState.id == id)
    ).forEach((animationState) => animationState.update());
  }

  static bool? isShowRepaint(BuildContext context) {
    return context.findAncestorWidgetOfExactType<AfAnimations>()?.showRepaint;
  }


  static void _subscription(BuildContext context, _AfAnimationsWidgetsState state) {
    if (!existsAncestor(context)) return;

    _unsubscribeOnDisposedStates(context);
    context.findAncestorStateOfType<_AfAnimationsState>()!._afAnimationsWidgetsStates.add(state);
  }

  static void _unsubscribe(BuildContext context, _AfAnimationsWidgetsState state) {
    if (!existsAncestor(context)) return;

    context.findAncestorStateOfType<_AfAnimationsState>()!._afAnimationsWidgetsStates.removeWhere(
      (animationState) => animationState.uniqueId == state.uniqueId
    );
  }

  static void _unsubscribeOnDisposedStates(BuildContext context) {
    context.findAncestorStateOfType<_AfAnimationsState>()!._afAnimationsWidgetsStates.removeWhere(
      (animationState) => !animationState.mounted(),
    );
  }

  @override
  State<AfAnimations> createState() => _AfAnimationsState();

}

class _AfAnimationsState extends State<AfAnimations> {

  final List<_AfAnimationsWidgetsState> _afAnimationsWidgetsStates = <_AfAnimationsWidgetsState>[];

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

}

