part of '../af_animations.dart';

/// {@template AfWidgets_AfAnimatedColor}
/// Animating a color value by interpolating to the new color,
/// a dynamic animation widget using ```AfAnimations.update```
/// or by using ```AfController``` and ```controller.update```, will animate the change.
/// 
/// This widget is useful for animating background colors, text colors, border colors,
/// or any other color property with smooth transitions.
/// {@endtemplate}
///
/// {@macro AfWidgets_howToUse}
///
/// All AfWidgets
/// {@macro AfWidgets_all}
class AfAnimatedColor extends StatefulWidget {
  /// {@macro AfWidgets_AfAnimatedColor}
  const AfAnimatedColor({
    super.key,
    this.controller,
    this.id = "",
    required this.color,
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

  /// The color value to update for performing the interpolation animation in the builder.
  /// 
  /// {@macro AfWidgets_whyFunction}
  final Color Function() color;

  /// Called to obtain the child widget.
  ///
  /// This function is called whenever this widget is included in its parent's
  /// build and the old widget (if any) that it synchronizes with has a distinct
  /// object identity. Typically the parent's build method will construct
  /// a new tree of widgets and so a new Builder child will not be [identical]
  /// to the corresponding old one.
  ///
  /// And it also returns the current color value of the animation.
  final Widget Function(
    BuildContext context,
    Color color,
    Widget child,
  ) builder;

  /// {@macro AfWidgetOn_initState}
  final void Function()? initState;

  /// {@macro AfWidgetOn_didUpdateWidget}
  final void Function(AfAnimatedColor oldWidget)? didUpdateWidget;

  /// {@macro AfWidgetOn_didChangeDependencies}
  final void Function()? didChangeDependencies;

  /// {@macro AfWidgetOn_dispose}
  final void Function()? dispose;

  @override
  State<AfAnimatedColor> createState() => _AfAnimatedColorState();
}

class _AfAnimatedColorState extends _AfWidget<AfAnimatedColor> {
  late Color color;

  @override
  String get id => widget.id;

  @override
  AfController? get controller => widget.controller;

  @override
  _AfWidgetOn<AfAnimatedColor> get afWidgetOn {
    return _AfWidgetOn<AfAnimatedColor>(
      initState: widget.initState,
      didUpdateWidget: widget.didUpdateWidget,
      didChangeDependencies: widget.didChangeDependencies,
      dispose: widget.dispose,
    );
  }

  @override
  void update() {
    color = widget.color();
  }

  @override
  Widget build(BuildContext context) {
    return _AfAnimatedColor(
      controller: controller,
      color: color,
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

/// Used exclusively for ```AfAnimatedColor```
class _AfAnimatedColor extends ImplicitlyAnimatedWidget {
  /// Used exclusively for ```AfAnimatedColor```
  const _AfAnimatedColor({
    Key? key,
    required this.color,
    required this.builder,
    required this.controller,
    required this.child,
    required Curve curve,
    required Duration duration,
    required VoidCallback? onEnd,
  }) : super(key: key, curve: curve, duration: duration, onEnd: onEnd);

  /// {@macro AfController}
  final AfController? controller;

  /// The color value of the animation to update.
  final Color color;

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
  /// And it also returns the current color value of the animation.
  final Widget Function(
    BuildContext context,
    Color color,
    Widget child,
  ) builder;

  @override
  __AfAnimatedColorState createState() => __AfAnimatedColorState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<Color>('color', color, defaultValue: null));
  }
}

class __AfAnimatedColorState extends AnimatedWidgetBaseState<_AfAnimatedColor> {
  ColorTween? _colorTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _colorTween = visitor(_colorTween, widget.color,
            (dynamic value) => ColorTween(begin: value as Color))
        as ColorTween?;
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder
        .call(
          context,
          _colorTween?.evaluate(animation) ?? Colors.transparent,
          widget.child ?? const SizedBox.shrink(),
        )
        .afShowRepaint(context, controller: widget.controller);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DiagnosticsProperty<ColorTween>('color', _colorTween,
        defaultValue: null));
  }
} 