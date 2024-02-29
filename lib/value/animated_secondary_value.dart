part of '../af_animations.dart';

/// {@template AfWidgets_AfAnimatedSecondaryValue}
/// Animates two values independently by interpolating towards the new value,
/// a very dynamic animation widget and using ```AfAnimations.update```
/// or by using ```AfController``` and ```controller.update```, will animate the change.
/// {@endtemplate}
///
/// {@macro AfWidgets_howToUse}
///
/// All AfWidgets
/// {@macro AfWidgets_all}
class AfAnimatedSecondaryValue extends StatefulWidget {
  /// {@macro AfWidgets_AfAnimatedSecondaryValue}
  const AfAnimatedSecondaryValue({
    super.key,
    this.controller,
    this.id = "",
    required this.value,
    required this.secondaryValue,
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

  /// The value to update for performing the interpolation animation in the builder.
  final double Function() secondaryValue;

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
    double secondaryValue,
    Widget child,
  ) builder;

  /// {@macro AfWidgetOn_initState}
  final void Function()? initState;

  /// {@macro AfWidgetOn_didUpdateWidget}
  final void Function(AfAnimatedSecondaryValue oldWidget)? didUpdateWidget;

  /// {@macro AfWidgetOn_didChangeDependencies}
  final void Function()? didChangeDependencies;

  /// {@macro AfWidgetOn_dispose}
  final void Function()? dispose;

  @override
  State<AfAnimatedSecondaryValue> createState() =>
      _AfAnimatedSecondaryValueState();
}

class _AfAnimatedSecondaryValueState
    extends _AfWidget<AfAnimatedSecondaryValue> {
  late double value;
  late double secondaryValue;

  @override
  String get id => widget.id;

  @override
  AfController? get controller => widget.controller;

  @override
  _AfWidgetOn<AfAnimatedSecondaryValue> get afWidgetOn {
    return _AfWidgetOn<AfAnimatedSecondaryValue>(
      initState: widget.initState,
      didUpdateWidget: widget.didUpdateWidget,
      didChangeDependencies: widget.didChangeDependencies,
      dispose: widget.dispose,
    );
  }

  @override
  void update() {
    value = widget.value();
    secondaryValue = widget.secondaryValue();
  }

  @override
  Widget build(BuildContext context) {
    return _AfAnimatedSecondaryValue(
      controller: controller,
      value: value,
      secondaryValue: secondaryValue,
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

/// Used exclusively for ```AfAnimatedSecondaryValue```
class _AfAnimatedSecondaryValue extends ImplicitlyAnimatedWidget {
  /// Used exclusively for ```AfAnimatedSecondaryValue```
  const _AfAnimatedSecondaryValue({
    Key? key,
    required this.value,
    required this.secondaryValue,
    required this.builder,
    required this.controller,
    required this.child,
    required Curve curve,
    required Duration duration,
    required VoidCallback? onEnd,
  }) : super(key: key, curve: curve, duration: duration, onEnd: onEnd);

  /// {@macro AfController}
  final AfController? controller;

  /// The value of the animation to update.
  final double value;

  /// The value of the animation to update.
  final double secondaryValue;

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
  /// And it also returns the current value's of the animation.
  final Widget Function(
    BuildContext context,
    double value,
    double secondaryValue,
    Widget child,
  ) builder;

  @override
  __AfAnimatedSecondaryValueState createState() =>
      __AfAnimatedSecondaryValueState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<double>('value', value, defaultValue: null));
  }
}

class __AfAnimatedSecondaryValueState
    extends AnimatedWidgetBaseState<_AfAnimatedSecondaryValue> {
  Tween<double>? _valueTween;
  Tween<double>? _secondaryValueTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _valueTween = visitor(_valueTween, widget.value,
            (dynamic value) => Tween<double>(begin: value as double))
        as Tween<double>?;
    _secondaryValueTween = visitor(_secondaryValueTween, widget.secondaryValue,
            (dynamic value) => Tween<double>(begin: value as double))
        as Tween<double>?;
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder
        .call(
          context,
          _valueTween?.evaluate(animation) ?? 0,
          _secondaryValueTween?.evaluate(animation) ?? 0,
          widget.child ?? const SizedBox.shrink(),
        )
        .afShowRepaint(context, controller: widget.controller);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DiagnosticsProperty<Tween<double>>('value', _valueTween,
        defaultValue: null));
  }
}
