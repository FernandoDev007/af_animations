part of '../af_animations.dart';

/// {@template AfWidgets_AfAnimatedBoxDecoration}
/// Animating a BoxDecoration by interpolating to the new decoration,
/// a dynamic animation widget using ```AfAnimations.update```
/// or by using ```AfController``` and ```controller.update```, will animate the change.
/// 
/// This widget provides smooth transitions for BoxDecoration changes using DecorationTween,
/// making it perfect for animating background colors, borders, border radius, shadows,
/// gradients, and other decoration properties without affecting layout.
/// {@endtemplate}
///
/// {@macro AfWidgets_howToUse}
///
/// All AfWidgets
/// {@macro AfWidgets_all}
class AfAnimatedBoxDecoration extends StatefulWidget {
  /// {@macro AfWidgets_AfAnimatedBoxDecoration}
  const AfAnimatedBoxDecoration({
    super.key,
    this.controller,
    this.id = "",
    required this.decoration,
    required this.child,
    this.duration,
    this.curve,
    this.onEnd,
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
  final Widget child;

  /// The BoxDecoration to update for performing the interpolation animation.
  /// This decoration contains properties like color, border, borderRadius,
  /// boxShadow, gradient, and shape that will be smoothly animated.
  /// 
  /// {@macro AfWidgets_whyFunction}
  final BoxDecoration Function() decoration;

  /// {@macro AfWidgetOn_initState}
  final void Function()? initState;

  /// {@macro AfWidgetOn_didUpdateWidget}
  final void Function(AfAnimatedBoxDecoration oldWidget)? didUpdateWidget;

  /// {@macro AfWidgetOn_didChangeDependencies}
  final void Function()? didChangeDependencies;

  /// {@macro AfWidgetOn_dispose}
  final void Function()? dispose;

  @override
  State<AfAnimatedBoxDecoration> createState() => _AfAnimatedBoxDecorationState();
}

class _AfAnimatedBoxDecorationState extends _AfWidget<AfAnimatedBoxDecoration> {
  late BoxDecoration decoration;

  @override
  String get id => widget.id;

  @override
  AfController? get controller => widget.controller;

  @override
  _AfWidgetOn<AfAnimatedBoxDecoration> get afWidgetOn {
    return _AfWidgetOn<AfAnimatedBoxDecoration>(
      initState: widget.initState,
      didUpdateWidget: widget.didUpdateWidget,
      didChangeDependencies: widget.didChangeDependencies,
      dispose: widget.dispose,
    );
  }

  @override
  void update() {
    decoration = widget.decoration();
  }

  @override
  Widget build(BuildContext context) {
    return _AfAnimatedBoxDecoration(
      controller: controller,
      decoration: decoration,
      duration: widget.duration ?? widget.controller?.duration ?? AfAnimations.getDuration(context),
      curve: widget.curve ?? widget.controller?.curve ?? AfAnimations.getCurve(context),
      onEnd: () {
        widget.onEnd?.call();
        AfAnimations.callOnEnd(context);
        controller?.callOnEnd();
      },
      child: widget.child,
    );
  }
}

/// Used exclusively for ```AfAnimatedBoxDecoration```
class _AfAnimatedBoxDecoration extends ImplicitlyAnimatedWidget {
  /// Used exclusively for ```AfAnimatedBoxDecoration```
  const _AfAnimatedBoxDecoration({
    Key? key,
    required this.decoration,
    required this.controller,
    required Curve curve,
    required Duration duration,
    required VoidCallback? onEnd,
    required this.child,
  }) : super(key: key, curve: curve, duration: duration, onEnd: onEnd);

  /// {@macro AfController}
  final AfController? controller;

  /// The BoxDecoration value of the animation to update.
  final BoxDecoration decoration;

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  __AfAnimatedBoxDecorationState createState() => __AfAnimatedBoxDecorationState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<BoxDecoration>('decoration', decoration));
  }
}

class __AfAnimatedBoxDecorationState extends AnimatedWidgetBaseState<_AfAnimatedBoxDecoration> {
  DecorationTween? _decorationTween;
  late Animation<Decoration?> _decorationAnimation;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _decorationTween = visitor(_decorationTween, widget.decoration,
            (dynamic value) => DecorationTween(begin: value as Decoration))
        as DecorationTween?;
  }

  @override
  void didUpdateTweens() {
    _decorationAnimation = animation.drive(_decorationTween!);
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _decorationAnimation.value ?? widget.decoration,
      child: widget.child.afShowRepaint(context, controller: widget.controller),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DiagnosticsProperty<Animation<Decoration?>>('decoration', _decorationAnimation));
  }
} 