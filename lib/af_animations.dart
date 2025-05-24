library af_animations;

import 'dart:collection';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

part 'af_controller.dart';
part 'af_widget.dart';
part 'af_widget_on.dart';
part 'af_widget_state.dart';
part 'extensions/widgets_extension.dart';
part 'layout_animations/animated_clip_rrect.dart';
part 'property_animations/animated_color.dart';
part 'property_animations/animated_composed.dart';
part 'property_animations/animated_opacity.dart';
part 'property_animations/animated_secondary_value.dart';
part 'property_animations/animated_size.dart';
part 'property_animations/animated_value.dart';
part 'utility_widgets/builder.dart';

/// {@template AfAnimations}
/// The AfAnimations widget serves to globally set the duration and curve for all used AfWidgets.
/// You can retrieve the specified data here. Below this, you can see how it is done.
///
/// All the documentation was created with the help of GPT-4.
/// If you find any errors, please let me know by starting a new discussion or PR :)
/// https://github.com/FernandoDev007/af_animations
/// {@endtemplate}
///
/// {@template AfAnimations_examples}
/// ### Examples:
/// ```dart
/// class MyApp extends StatefulWidget {
///   const MyApp({super.key});
///
///   @override
///   State<MyApp> createState() => _MyAppState();
/// }
///
/// class _MyAppState extends State<MyApp> {
///
///   @override
///   Widget build(BuildContext context) {
///     /// You can also add it to a specific screen to apply it only screen
///     return AfAnimations(
///       // You will be able to specify the duration of animations globally
///       duration: const Duration(milliseconds: 500),
///       // You will be able to specify the curve of animations globally
///       curve: Curves.easeInOut,
///       // Only for testing
///       showRepaint: true,
///       child: MaterialApp(
///         ...
///       ),
///     );
///   }
/// }
///
/// ```
/// {@endtemplate}
///
/// {@template AfAnimations_principalGetters}
/// Afterwards, in your project, you will be able to retrieve the globally specified values as follows:
/// ```dart
/// Duration globalDuration = AfAnimations.getDuration(context);
/// Curve globalCurve = AfAnimations.getCurve(context);
/// bool? showRepaint = AfAnimations.isShowRepaint(context);
/// ```
/// {@endtemplate}
///
/// {@template AfAnimations_allGetters}
/// You can also use these others:
/// ```dart
/// bool existsAncestor = AfAnimations.existsAncestor(context);
/// /// If for any reason you want to use it.
/// AfAnimations.callOnEnd(context);
/// /// Update all AfWidgets without a specified ID.
/// AfAnimations.update(context);
/// /// You specify the IDs to update, and it will update the widget entirely in an optimal way.
/// AfAnimations.update(context, ids: ["updateIcon", "updateValue", "Another"]);
/// ```
/// {@endtemplate}
///
/// These functions will work in these AfWidgets
/// {@macro AfWidgets_all}
///
///
/// ## Alternative without context to AfAnimations: AfController
/// {@macro AfController}
class AfAnimations extends StatefulWidget {
  /// {@macro AfAnimations}
  /// {@macro AfAnimations_examples}
  /// {@macro AfAnimations_principalGetters}
  /// {@macro AfAnimations_allGetters}
  const AfAnimations({
    super.key,
    required this.child,
    this.duration,
    this.curve,
    this.onEnd,
    this.showRepaint = false,
  });

  /// {@template AfAnimations_child}
  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  /// {@endtemplate}
  final Widget child;

  /// {@template AfAnimations_duration}
  /// The global duration over which the AfWidgets will be animated.
  ///
  /// {@macro AfAnimations_principalGetters}
  /// {@endtemplate}
  final Duration? duration;

  /// {@template AfAnimations_curve}
  /// The global curve over which the AfWidgets will be animated.
  ///
  /// {@macro AfAnimations_principalGetters}
  /// {@endtemplate}
  final Curve? curve;

  /// {@template AfAnimations_onEnd}
  /// Called every time an animation completes.
  ///
  /// This can be useful to trigger additional actions (e.g. another animation)
  /// at the end of the current animation.
  /// {@endtemplate}
  final void Function()? onEnd;

  /// {@template AfAnimations_showRepaint}
  /// If the showRepaint widget extension is set to true
  /// (You can use it in your current project to perform performance tests),
  /// all widget rebuilds will be visually displayed, making it easier to identify areas
  /// where performance can be improved, by avoiding unnecessary rebuilds.
  ///
  /// A border of a specific color will be displayed, which will change when a widget rebuild occurs.
  ///
  /// {@macro AfAnimations_principalGetters}
  /// {@endtemplate}
  final bool showRepaint;

  /// Unique identifier for each _AfWidgetState used.
  static String get _getIdentifier =>
      "K${UniqueKey()}D${DateTime.now().millisecondsSinceEpoch}";

  /// Default variable in case the animation duration is not specified.
  static Duration get _defaultDuration => const Duration(milliseconds: 300);

  /// Default variable in case the animation curve is not specified.
  static Curve get _defaultCurve => Curves.easeInOut;

  /// Check if there is an ancestor AfAnimations and perform an action based on that
  /// {@macro AfAnimations_allGetters}
  static bool existsAncestor(BuildContext context) {
    return context.findAncestorWidgetOfExactType<AfAnimations>() != null;
  }

  /// {@macro AfAnimations_principalGetters}
  static Duration getDuration(BuildContext context) {
    return context.findAncestorWidgetOfExactType<AfAnimations>()?.duration ??
        AfAnimations._defaultDuration;
  }

  /// {@macro AfAnimations_principalGetters}
  static Curve getCurve(BuildContext context) {
    return context.findAncestorWidgetOfExactType<AfAnimations>()?.curve ??
        AfAnimations._defaultCurve;
  }

  /// {@macro AfAnimations_principalGetters}
  static bool? isShowRepaint(BuildContext context) {
    return context.findAncestorWidgetOfExactType<AfAnimations>()?.showRepaint;
  }

  /// {@macro AfAnimations_allGetters}
  static void callOnEnd(BuildContext context) {
    context.findAncestorWidgetOfExactType<AfAnimations>()?.onEnd?.call();
  }

  /// {@macro AfAnimations_allGetters}
  static void update(BuildContext context,
      {List<String> ids = const <String>[""]}) {
    if (!existsAncestor(context)) {
      throw FlutterError(
          "AfAnimations Error - No ancestor was found, wrap MaterialApp "
          "or another parent (As Scaffold) with AfAnimations "
          "(To be able to use AfAnimations.update) "
          "or you can replace it using AfController, which doesn't require context to function");
    }

    final _AfAnimationsState state = context.findAncestorStateOfType<_AfAnimationsState>()!;
    
    // If no IDs are specified or an empty ID is used, update widgets without a specific ID
    if (ids.isEmpty || (ids.length == 1 && ids[0].isEmpty)) {
      final emptyIdWidgets = state.afWidgetStatesMap[_AfAnimationsState._defaultIdKey];
      if (emptyIdWidgets != null) {
        for (_AfWidgetState afWidget in emptyIdWidgets) {
          if (afWidget.mounted()) {
            afWidget.update();
          }
        }
      }
      return;
    }

    // Update widgets with specific IDs
    for (String id in ids) {
      final widgetsWithId = state.afWidgetStatesMap[id];
      if (widgetsWithId != null) {
        for (_AfWidgetState afWidget in widgetsWithId) {
          if (afWidget.mounted()) {
            afWidget.update();
          }
        }
      }
    }
  }

  /// {@template AfAnimations_subscription}
  /// Subscribe a _AfWidgetState to listen for a possible [AfAnimations.update]
  /// to update the widget and make the respective changes
  /// {@endtemplate}
  static void _subscription(BuildContext context, _AfWidgetState state) {
    if (!existsAncestor(context)) return;

    _unsubscribeOnDisposedStates(context);
    
    final _AfAnimationsState animationsState = context.findAncestorStateOfType<_AfAnimationsState>()!;
    final String idKey = state.id.isEmpty ? _AfAnimationsState._defaultIdKey : state.id;
    
    // Initialize the queue for this ID if it doesn't exist
    animationsState.afWidgetStatesMap[idKey] ??= DoubleLinkedQueue<_AfWidgetState>();
    // Add the widget to the corresponding queue
    animationsState.afWidgetStatesMap[idKey]!.add(state);
  }

  /// {@template AfAnimations_unsubscribe}
  /// Cancel the subscription of a _AfWidgetState when it's not possible to listen
  /// for [AfAnimations.update], thus freeing up some resources
  /// {@endtemplate}
  static void _unsubscribe(BuildContext context, _AfWidgetState state) {
    if (!existsAncestor(context)) return;

    final _AfAnimationsState animationsState = context.findAncestorStateOfType<_AfAnimationsState>()!;
    final String idKey = state.id.isEmpty ? _AfAnimationsState._defaultIdKey : state.id;
    
    // Get the queue for this ID
    final DoubleLinkedQueue<_AfWidgetState>? widgetsWithId = animationsState.afWidgetStatesMap[idKey];
    if (widgetsWithId != null) {
      // Remove the specific widget from the queue
      widgetsWithId.removeWhere((afWidget) => afWidget.uniqueId == state.uniqueId);
      
      // If the queue is empty, remove the entry from the map
      if (widgetsWithId.isEmpty) {
        animationsState.afWidgetStatesMap.remove(idKey);
      }
    }
  }

  /// Unsubscribe all _AfWidgetState for AfWidgets that are no longer displayed
  /// on the current screen. If they become visible again, they will be subscribed again.
  static void _unsubscribeOnDisposedStates(BuildContext context) {
    final _AfAnimationsState animationsState = context.findAncestorStateOfType<_AfAnimationsState>()!;
    
    // Iterate over all entries in the map
    animationsState.afWidgetStatesMap.forEach((id, widgetsQueue) {
      widgetsQueue.removeWhere((afWidget) => !afWidget.mounted());
    });
    
    // Remove entries with empty queues
    animationsState.afWidgetStatesMap.removeWhere((_, widgetsQueue) => widgetsQueue.isEmpty);
  }

  @override
  State<AfAnimations> createState() => _AfAnimationsState();
}

class _AfAnimationsState extends State<AfAnimations> {

  /// The HashMap where all _AfWidgetState are stored grouped by ID
  /// to be updated later with AfAnimations.update.
  /// Using HashMap optimizes lookup operations to O(1) complexity.
  /// 
  /// DoubleLinkedQueue is used for each ID group for optimal performance
  /// with add and remove operations during animation updates.
  final HashMap<String, DoubleLinkedQueue<_AfWidgetState>> afWidgetStatesMap = 
      HashMap<String, DoubleLinkedQueue<_AfWidgetState>>();
  
  /// Special ID for widgets without a specific ID
  static const String _defaultIdKey = "default";

  @override
  Widget build(BuildContext context) => widget.child;

}
