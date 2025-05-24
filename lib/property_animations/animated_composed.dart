part of '../af_animations.dart';

/// {@template AfWidgets_AfAnimatedComposed}
/// Combines multiple values into a single animation by interpolating each value independently,
/// a very powerful and flexible animation widget using ```AfAnimations.update```
/// or by using ```AfController``` and ```controller.update```, will animate all changes in sync.
/// 
/// This widget is ideal for complex animations that need to animate multiple properties simultaneously,
/// providing a clean API while maintaining optimal performance.
/// {@endtemplate}
///
/// {@macro AfWidgets_howToUse}
///
/// All AfWidgets
/// {@macro AfWidgets_all}
class AfAnimatedComposed extends StatefulWidget {
  /// {@macro AfWidgets_AfAnimatedComposed}
  const AfAnimatedComposed({
    super.key,
    this.controller,
    this.id = "",
    required this.values,
    required this.builder,
    this.duration,
    this.curve,
    this.curves,
    this.onEnd,
    this.child,
    this.initState,
    this.didUpdateWidget,
    this.didChangeDependencies,
    this.dispose,
  });

  /// {@macro AfController}
  final AfController? controller;

  /// {@macro AfWidgets_id}
  final String id;

  /// {@macro AfWidgets_duration}
  final Duration? duration;

  /// {@macro AfWidgets_curve}
  /// If both curve and curves are provided, individual curves will take precedence.
  final Curve? curve;

  /// Optional list of curves for each value.
  /// This allows using different easing curves for each animated value.
  /// If provided, the list length should match the values list length.
  /// If not provided or if the list is shorter than values, the main curve will be used.
  final List<Curve>? curves;

  /// {@macro AfAnimations_onEnd}
  final VoidCallback? onEnd;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget? child;

  /// The list of values to animate.
  /// Each function should return a double value that will be interpolated during animation.
  /// 
  /// {@macro AfWidgets_whyFunction}
  final List<double Function()> values;

  /// Called to obtain the child widget.
  ///
  /// This function is called whenever this widget is included in its parent's
  /// build and the old widget (if any) that it synchronizes with has a distinct
  /// object identity. Typically the parent's build method will construct
  /// a new tree of widgets and so a new Builder child will not be [identical]
  /// to the corresponding old one.
  ///
  /// It receives the list of current animation values and the child widget.
  final Widget Function(
    BuildContext context,
    List<double> values,
    Widget child,
  ) builder;

  /// {@macro AfWidgetOn_initState}
  final void Function()? initState;

  /// {@macro AfWidgetOn_didUpdateWidget}
  final void Function(AfAnimatedComposed oldWidget)? didUpdateWidget;

  /// {@macro AfWidgetOn_didChangeDependencies}
  final void Function()? didChangeDependencies;

  /// {@macro AfWidgetOn_dispose}
  final void Function()? dispose;

  @override
  State<AfAnimatedComposed> createState() => _AfAnimatedComposedState();
}

class _AfAnimatedComposedState extends _AfWidget<AfAnimatedComposed> {
  late List<double> values;

  @override
  String get id => widget.id;

  @override
  AfController? get controller => widget.controller;

  @override
  _AfWidgetOn<AfAnimatedComposed> get afWidgetOn {
    return _AfWidgetOn<AfAnimatedComposed>(
      initState: widget.initState,
      didUpdateWidget: widget.didUpdateWidget,
      didChangeDependencies: widget.didChangeDependencies,
      dispose: widget.dispose,
    );
  }

  @override
  void update() {
    values = widget.values.map((valueFunc) => valueFunc()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return _AfAnimatedComposed(
      controller: controller,
      values: values,
      curves: widget.curves,
      builder: widget.builder,
      duration: widget.duration ?? widget.controller?.duration ?? AfAnimations.getDuration(context),
      curve: widget.curve ?? widget.controller?.curve ?? AfAnimations.getCurve(context),
      onEnd: () {
        widget.onEnd?.call();
        AfAnimations.callOnEnd(context);
        controller?.callOnEnd();
      },
      child: widget.child ?? const SizedBox.shrink(),
    );
  }
}

/// Used exclusively for ```AfAnimatedComposed```
class _AfAnimatedComposed extends ImplicitlyAnimatedWidget {
  /// Used exclusively for ```AfAnimatedComposed```
  const _AfAnimatedComposed({
    Key? key,
    required this.values,
    required this.builder,
    required this.controller,
    required this.child,
    this.curves,
    required Curve curve,
    required Duration duration,
    required VoidCallback? onEnd,
  }) : super(key: key, curve: curve, duration: duration, onEnd: onEnd);

  /// {@macro AfController}
  final AfController? controller;

  /// The list of values to animate.
  final List<double> values;

  /// Optional list of curves for each value.
  final List<Curve>? curves;

  /// The widget below this widget in the tree.
  final Widget? child;

  /// Called to obtain the child widget.
  ///
  /// This function is called whenever this widget is included in its parent's
  /// build and the old widget (if any) that it synchronizes with has a distinct
  /// object identity. Typically the parent's build method will construct
  /// a new tree of widgets and so a new Builder child will not be [identical]
  /// to the corresponding old one.
  ///
  /// It receives the list of current animation values and the child widget.
  final Widget Function(
    BuildContext context,
    List<double> values,
    Widget child,
  ) builder;

  @override
  __AfAnimatedComposedState createState() => __AfAnimatedComposedState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<List<double>>('values', values,
        defaultValue: null));
  }
}

class __AfAnimatedComposedState extends AnimatedWidgetBaseState<_AfAnimatedComposed> {
  List<Tween<double>?> _valueTweens = [];

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    // Ensure we have enough tweens for all values
    if (_valueTweens.length != widget.values.length) {
      _valueTweens = List<Tween<double>?>.filled(widget.values.length, null);
    }
    
    // Update each tween
    for (int i = 0; i < widget.values.length; i++) {
      _valueTweens[i] = visitor(
        _valueTweens[i],
        widget.values[i],
        (dynamic value) => Tween<double>(begin: value as double),
      ) as Tween<double>?;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Evaluate all tweens with their respective curves
    final animatedValues = List<double>.filled(widget.values.length, 0.0);
    
    for (int i = 0; i < widget.values.length; i++) {
      // Use curve-specific animation if available
      final Animation<double> curveAnimation = widget.curves != null && i < widget.curves!.length
          ? CurvedAnimation(parent: animation, curve: widget.curves![i])
          : CurvedAnimation(parent: animation, curve: widget.curve);
          
      animatedValues[i] = _valueTweens[i]?.evaluate(curveAnimation) ?? 0.0;
    }

    return widget.builder
        .call(
          context,
          animatedValues,
          widget.child ?? const SizedBox.shrink(),
        )
        .afShowRepaint(context, controller: widget.controller);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DiagnosticsProperty<List<Tween<double>?>>('values', _valueTweens,
        defaultValue: null));
  }
} 