part of '../af_animations.dart';


/// {@template AfWidgets_AfAnimatedValue}
/// Animating a single value by interpolating to the new value,
/// a very dynamic animation widget and using ```AfAnimations.update```
/// or by using ```AfController``` and ```controller.update```, will animate the change.
/// {@endtemplate}
///
/// {@macro AfWidgets_howToUse}
/// 
/// All AfWidgets
/// {@macro AfWidgets_all}
class AfAnimatedValue extends StatefulWidget {

  /// {@macro AfWidgets_AfAnimatedValue}
  const AfAnimatedValue({
    super.key,
    this.controller,
    this.id = "",
    required this.value,
    required this.builder,
    this.duration,
    this.curve,
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
  final Curve? curve;

  /// {@macro AfAnimations_onEnd}
  final VoidCallback? onEnd;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget? child;

  /// The value to update for performing the interpolation animation in the builder.
  final double Function() value;

  /// Called to obtain the child widget.
  ///
  /// This function is called whenever this widget is included in its parent's
  /// build and the old widget (if any) that it synchronizes with has a distinct
  /// object identity. Typically the parent's build method will construct
  /// a new tree of widgets and so a new Builder child will not be [identical]
  /// to the corresponding old one.
  /// 
  /// And it also returns the current value of the animation.
  final Widget Function(
    BuildContext context,
    double value,
    Widget child,
  ) builder;

  /// {@macro AfWidgetOn_initState}
  final void Function()? initState;

  /// {@macro AfWidgetOn_didUpdateWidget}
  final void Function(AfAnimatedValue oldWidget)? didUpdateWidget;

  /// {@macro AfWidgetOn_didChangeDependencies}
  final void Function()? didChangeDependencies;

  /// {@macro AfWidgetOn_dispose}
  final void Function()? dispose;

  @override
  State<AfAnimatedValue> createState() => _AfAnimatedValueState();

}

class _AfAnimatedValueState extends _AfWidget<AfAnimatedValue> {

  late double value;

  @override
  String get id => widget.id;

  @override
  AfController? get controller => widget.controller;

  @override
  _AfWidgetOn<AfAnimatedValue> get afWidgetOn => _AfWidgetOn<AfAnimatedValue>(
    initState: widget.initState,
    didUpdateWidget: widget.didUpdateWidget,
    didChangeDependencies: widget.didChangeDependencies,
    dispose: widget.dispose,
  );

  @override
  void update() {
    value = widget.value();
  }

  @override
  Widget build(BuildContext context) {
    return _AfAnimatedValue(
      controller: controller,
      value: value,
      builder: widget.builder,
      duration: widget.duration ?? AfAnimations.getDuration(context),
      curve: widget.curve ?? AfAnimations.getCurve(context),
      onEnd: () {
        widget.onEnd?.call();
        AfAnimations.callOnEnd(context);
        controller?.callOnEnd();
      },
      child: widget.child ?? const SizedBox.shrink(),
    );
  }

}



/// Used exclusively for ```AfAnimatedValue```
class _AfAnimatedValue extends ImplicitlyAnimatedWidget {

  /// Used exclusively for ```AfAnimatedValue```
  const _AfAnimatedValue({
    Key? key,
    required this.value,
    required this.builder,
    required this.controller,
    required this.child,
    required Curve curve,
    required Duration duration,
    required VoidCallback? onEnd,
  }) : super(
    key: key,
    curve: curve,
    duration: duration,
    onEnd: onEnd
  );

  /// {@macro AfController}
  final AfController? controller;

  /// The value of the animation to update.
  final double value;

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
  /// And it also returns the current value of the animation.
  final Widget Function(
    BuildContext context,
    double value,
    Widget child,
  ) builder;


  @override
  __AfAnimatedValueState createState() => __AfAnimatedValueState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<double>('value', value, defaultValue: null));
  }

}

class __AfAnimatedValueState extends AnimatedWidgetBaseState<_AfAnimatedValue> {

  Tween<double>? _valueTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _valueTween = visitor(
      _valueTween,
      widget.value,
      (dynamic value) => Tween<double>(begin: value as double)
    ) as Tween<double>?;
  }


  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      _valueTween?.evaluate(animation) ?? 0,
      widget.child ?? const SizedBox.shrink(),
    ).afShowRepaint(context, controller: widget.controller);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DiagnosticsProperty<Tween<double>>('value', _valueTween, defaultValue: null));
  }

}

