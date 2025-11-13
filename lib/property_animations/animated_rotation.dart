part of '../af_animations.dart';

/// {@template AfWidgets_AfAnimatedRotation}
/// Animating a rotation value by interpolating to the new angle,
/// a dynamic animation widget using ```AfAnimations.update```
/// or by using ```AfController``` and ```controller.update```, will animate the change.
/// 
/// This widget provides smooth transitions for rotation changes using transforms,
/// making it perfect for rotating widgets, creating spin animations, or any widget
/// that needs rotation-based animations without affecting layout.
/// {@endtemplate}
///
/// {@macro AfWidgets_howToUse}
///
/// All AfWidgets
/// {@macro AfWidgets_all}
class AfAnimatedRotation extends StatefulWidget {
  /// {@macro AfWidgets_AfAnimatedRotation}
  const AfAnimatedRotation({
    super.key,
    this.controller,
    this.id = "",
    required this.angle,
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

  /// The rotation angle value to update for performing the interpolation animation.
  /// The angle is specified in double degrees: 0, 90, 180, 270, 360
  /// 
  /// {@macro AfWidgets_whyFunction}
  final double Function() angle;

  /// The alignment of the origin of the coordinate system around which the rotation occurs.
  /// 
  /// For example, if [alignment] is [Alignment.center], then the rotation will occur
  /// around the center of the widget. If [alignment] is [Alignment.topLeft], then
  /// the rotation will occur around the top-left corner.
  /// 
  /// Defaults to [Alignment.center].
  final AlignmentGeometry alignment;

  /// The origin of the coordinate system (relative to the upper left corner of
  /// this render object) around which to apply the rotation.
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
  final void Function(AfAnimatedRotation oldWidget)? didUpdateWidget;

  /// {@macro AfWidgetOn_didChangeDependencies}
  final void Function()? didChangeDependencies;

  /// {@macro AfWidgetOn_dispose}
  final void Function()? dispose;

  @override
  State<AfAnimatedRotation> createState() => _AfAnimatedRotationState();
}

class _AfAnimatedRotationState extends _AfWidget<AfAnimatedRotation> {
  late double angle;

  @override
  String get id => widget.id;

  @override
  AfController? get controller => widget.controller;

  @override
  _AfWidgetOn<AfAnimatedRotation> get afWidgetOn {
    return _AfWidgetOn<AfAnimatedRotation>(
      initState: widget.initState,
      didUpdateWidget: widget.didUpdateWidget,
      didChangeDependencies: widget.didChangeDependencies,
      dispose: widget.dispose,
    );
  }

  @override
  void update() {
    angle = widget.angle();
  }

  @override
  Widget build(BuildContext context) {
    return _AfAnimatedRotation(
      controller: controller,
      angle: angle,
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

/// Used exclusively for ```AfAnimatedRotation```
class _AfAnimatedRotation extends ImplicitlyAnimatedWidget {
  /// Used exclusively for ```AfAnimatedRotation```
  const _AfAnimatedRotation({
    Key? key,
    required this.angle,
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

  /// The rotation angle value of the animation to update.
  final double angle;

  /// The widget below this widget in the tree.
  final Widget child;

  /// The alignment of the origin of the coordinate system around which the rotation occurs.
  final AlignmentGeometry alignment;

  /// The origin of the coordinate system around which to apply the rotation.
  final Offset? origin;

  /// Whether to apply the transform to hit testing.
  final bool transformHitTests;

  /// The filter quality to use when applying the transform.
  final FilterQuality? filterQuality;

  @override
  __AfAnimatedRotationState createState() => __AfAnimatedRotationState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<double>('angle', angle, defaultValue: 0.0));
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

class __AfAnimatedRotationState extends AnimatedWidgetBaseState<_AfAnimatedRotation> {
  Tween<double>? _angleTween;
  late Animation<double> _angleAnimation;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _angleTween = visitor(_angleTween, widget.angle,
            (dynamic value) => Tween<double>(begin: value as double))
        as Tween<double>?;
  }

  @override
  void didUpdateTweens() {
    _angleAnimation = animation.drive(_angleTween!);
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _angleAnimation.value * 0.0174532925199433,
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
    description.add(DiagnosticsProperty<Animation<double>>('angle', _angleAnimation));
  }
} 