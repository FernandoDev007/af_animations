part of '../af_animations.dart';

/// {@template AfWidgets_AfAnimatedScale}
/// Animating a scale value by interpolating to the new scale,
/// a dynamic animation widget using ```AfAnimations.update```
/// or by using ```AfController``` and ```controller.update```, will animate the change.
/// 
/// This widget provides smooth transitions for scale changes using transforms,
/// making it perfect for scaling widgets, creating zoom animations, or any widget
/// that needs scale-based animations without affecting layout.
/// {@endtemplate}
///
/// {@macro AfWidgets_howToUse}
///
/// All AfWidgets
/// {@macro AfWidgets_all}
class AfAnimatedScale extends StatefulWidget {
  /// {@macro AfWidgets_AfAnimatedScale}
  const AfAnimatedScale({
    super.key,
    this.controller,
    this.id = "",
    required this.scale,
    required this.child,
    this.duration,
    this.curve,
    this.onEnd,
    this.alignment = Alignment.center,
    this.origin,
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

  /// The scale value to update for performing the interpolation animation.
  /// The scale value represents the scaling factor, where 1.0 is normal size,
  /// 2.0 is double size, 0.5 is half size, etc.
  /// 
  /// {@macro AfWidgets_whyFunction}
  final double Function() scale;

  /// The alignment of the origin of the coordinate system around which the scaling occurs.
  /// 
  /// For example, if [alignment] is [Alignment.center], then the scaling will occur
  /// around the center of the widget. If [alignment] is [Alignment.topLeft], then
  /// the scaling will occur around the top-left corner.
  /// 
  /// Defaults to [Alignment.center].
  final AlignmentGeometry alignment;

  /// The origin of the coordinate system (relative to the upper left corner of
  /// this render object) around which to apply the scaling.
  /// 
  /// Setting an origin is equivalent to conjugating the transform matrix by a
  /// translation. This property is provided just for convenience.
  final Offset? origin;

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
  /// scaling or rotation. Higher quality settings may improve visual appearance
  /// but can impact performance.
  final FilterQuality? filterQuality;

  /// {@macro AfWidgetOn_initState}
  final void Function()? initState;

  /// {@macro AfWidgetOn_didUpdateWidget}
  final void Function(AfAnimatedScale oldWidget)? didUpdateWidget;

  /// {@macro AfWidgetOn_didChangeDependencies}
  final void Function()? didChangeDependencies;

  /// {@macro AfWidgetOn_dispose}
  final void Function()? dispose;

  @override
  State<AfAnimatedScale> createState() => _AfAnimatedScaleState();
}

class _AfAnimatedScaleState extends _AfWidget<AfAnimatedScale> {
  late double scale;

  @override
  String get id => widget.id;

  @override
  AfController? get controller => widget.controller;

  @override
  _AfWidgetOn<AfAnimatedScale> get afWidgetOn {
    return _AfWidgetOn<AfAnimatedScale>(
      initState: widget.initState,
      didUpdateWidget: widget.didUpdateWidget,
      didChangeDependencies: widget.didChangeDependencies,
      dispose: widget.dispose,
    );
  }

  @override
  void update() {
    scale = widget.scale();
  }

  @override
  Widget build(BuildContext context) {
    return _AfAnimatedScale(
      controller: controller,
      scale: scale,
      duration: widget.duration ?? widget.controller?.duration ?? AfAnimations.getDuration(context),
      curve: widget.curve ?? widget.controller?.curve ?? AfAnimations.getCurve(context),
      alignment: widget.alignment,
      origin: widget.origin,
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

/// Used exclusively for ```AfAnimatedScale```
class _AfAnimatedScale extends ImplicitlyAnimatedWidget {
  /// Used exclusively for ```AfAnimatedScale```
  const _AfAnimatedScale({
    Key? key,
    required this.scale,
    required this.controller,
    required this.alignment,
    required this.origin,
    required this.transformHitTests,
    required this.filterQuality,
    required Curve curve,
    required Duration duration,
    required VoidCallback? onEnd,
    required this.child,
  }) : super(key: key, curve: curve, duration: duration, onEnd: onEnd);

  /// {@macro AfController}
  final AfController? controller;

  /// The scale value of the animation to update.
  final double scale;

  /// The widget below this widget in the tree.
  final Widget child;

  /// The alignment of the origin of the coordinate system around which the scaling occurs.
  final AlignmentGeometry alignment;

  /// The origin of the coordinate system around which to apply the scaling.
  final Offset? origin;

  /// Whether to apply the transform to hit testing.
  final bool transformHitTests;

  /// The filter quality to use when applying the transform.
  final FilterQuality? filterQuality;

  @override
  __AfAnimatedScaleState createState() => __AfAnimatedScaleState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<double>('scale', scale, defaultValue: 1.0));
    properties
        .add(DiagnosticsProperty<AlignmentGeometry>('alignment', alignment, defaultValue: Alignment.center));
    properties
        .add(DiagnosticsProperty<Offset>('origin', origin, defaultValue: null));
    properties
        .add(DiagnosticsProperty<bool>('transformHitTests', transformHitTests, defaultValue: true));
    properties
        .add(EnumProperty<FilterQuality>('filterQuality', filterQuality, defaultValue: null));
  }
}

class __AfAnimatedScaleState extends AnimatedWidgetBaseState<_AfAnimatedScale> {
  Tween<double>? _scaleTween;
  late Animation<double> _scaleAnimation;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _scaleTween = visitor(_scaleTween, widget.scale,
            (dynamic value) => Tween<double>(begin: value as double))
        as Tween<double>?;
  }

  @override
  void didUpdateTweens() {
    _scaleAnimation = animation.drive(_scaleTween!);
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _scaleAnimation.value,
      alignment: widget.alignment,
      origin: widget.origin,
      transformHitTests: widget.transformHitTests,
      filterQuality: widget.filterQuality,
      child: widget.child.afShowRepaint(context, controller: widget.controller),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DiagnosticsProperty<Animation<double>>('scale', _scaleAnimation));
  }
} 