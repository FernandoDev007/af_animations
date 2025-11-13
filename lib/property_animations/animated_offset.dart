part of '../af_animations.dart';

/// {@template AfWidgets_AfAnimatedOffset}
/// Animating an offset value by interpolating to the new offset,
/// a dynamic animation widget using ```AfAnimations.update```
/// or by using ```AfController``` and ```controller.update```, will animate the change.
/// 
/// This widget provides smooth transitions for position changes using transforms,
/// making it perfect for moving widgets, creating slide animations, or any widget
/// that needs position-based animations without affecting layout.
/// {@endtemplate}
///
/// {@macro AfWidgets_howToUse}
///
/// All AfWidgets
/// {@macro AfWidgets_all}
class AfAnimatedOffset extends StatefulWidget {
  /// {@macro AfWidgets_AfAnimatedOffset}
  const AfAnimatedOffset({
    super.key,
    this.controller,
    this.id = "",
    required this.offset,
    required this.child,
    this.duration,
    this.curve,
    this.onEnd,
    this.transformHitTests = true,
    this.filterQuality,
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

  /// The offset value to update for performing the interpolation animation.
  /// The Offset object contains dx and dy values that will be animated,
  /// representing the translation in logical pixels.
  /// 
  /// {@macro AfWidgets_whyFunction}
  final Offset Function() offset;

  /// Whether to apply the transform to hit testing.
  /// 
  /// When true, hit testing (like touch events) will be transformed along
  /// with the visual appearance. When false, hit testing will ignore the
  /// transform and use the original position.
  /// 
  /// Defaults to true.
  final bool transformHitTests;

  /// The filter quality to use when applying the transform.
  /// 
  /// This affects the quality of the rendering when the transform involves
  /// scaling or rotation. For simple translations, this has no effect.
  final FilterQuality? filterQuality;

  /// {@macro AfWidgetOn_initState}
  final void Function()? initState;

  /// {@macro AfWidgetOn_didUpdateWidget}
  final void Function(AfAnimatedOffset oldWidget)? didUpdateWidget;

  /// {@macro AfWidgetOn_didChangeDependencies}
  final void Function()? didChangeDependencies;

  /// {@macro AfWidgetOn_dispose}
  final void Function()? dispose;

  @override
  State<AfAnimatedOffset> createState() => _AfAnimatedOffsetState();
}

class _AfAnimatedOffsetState extends _AfWidget<AfAnimatedOffset> {
  late Offset offset;

  @override
  String get id => widget.id;

  @override
  AfController? get controller => widget.controller;

  @override
  _AfWidgetOn<AfAnimatedOffset> get afWidgetOn {
    return _AfWidgetOn<AfAnimatedOffset>(
      initState: widget.initState,
      didUpdateWidget: widget.didUpdateWidget,
      didChangeDependencies: widget.didChangeDependencies,
      dispose: widget.dispose,
    );
  }

  @override
  void update() {
    offset = widget.offset();
  }

  @override
  Widget build(BuildContext context) {
    return _AfAnimatedOffset(
      controller: controller,
      offset: offset,
      duration: widget.duration ?? widget.controller?.duration ?? AfAnimations.getDuration(context),
      curve: widget.curve ?? widget.controller?.curve ?? AfAnimations.getCurve(context),
      transformHitTests: widget.transformHitTests,
      filterQuality: widget.filterQuality,
      onEnd: () {
        widget.onEnd?.call();
        AfAnimations.callOnEnd(context);
        controller?.callOnEnd();
      },
      child: widget.child,
    );
  }
}

/// Used exclusively for ```AfAnimatedOffset```
class _AfAnimatedOffset extends ImplicitlyAnimatedWidget {
  /// Used exclusively for ```AfAnimatedOffset```
  const _AfAnimatedOffset({
    Key? key,
    required this.offset,
    required this.controller,
    required this.transformHitTests,
    required this.filterQuality,
    required Curve curve,
    required Duration duration,
    required VoidCallback? onEnd,
    required this.child,
  }) : super(key: key, curve: curve, duration: duration, onEnd: onEnd);

  /// {@macro AfController}
  final AfController? controller;

  /// The offset value of the animation to update.
  final Offset offset;

  /// The widget below this widget in the tree.
  final Widget child;

  /// Whether to apply the transform to hit testing.
  final bool transformHitTests;

  /// The filter quality to use when applying the transform.
  final FilterQuality? filterQuality;

  @override
  __AfAnimatedOffsetState createState() => __AfAnimatedOffsetState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<Offset>('offset', offset, defaultValue: Offset.zero));
    properties
        .add(DiagnosticsProperty<bool>('transformHitTests', transformHitTests, defaultValue: true));
    properties
        .add(EnumProperty<FilterQuality>('filterQuality', filterQuality, defaultValue: null));
  }
}

class __AfAnimatedOffsetState extends AnimatedWidgetBaseState<_AfAnimatedOffset> {
  Tween<Offset>? _offsetTween;
  late Animation<Offset> _offsetAnimation;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _offsetTween = visitor(_offsetTween, widget.offset,
            (dynamic value) => Tween<Offset>(begin: value as Offset))
        as Tween<Offset>?;
  }

  @override
  void didUpdateTweens() {
    _offsetAnimation = animation.drive(_offsetTween!);
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: _offsetAnimation.value,
      transformHitTests: widget.transformHitTests,
      filterQuality: widget.filterQuality,
      child: widget.child.afShowRepaint(context, controller: widget.controller),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DiagnosticsProperty<Animation<Offset>>('offset', _offsetAnimation));
  }
} 