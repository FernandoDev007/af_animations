part of '../af_animations.dart';

/// {@template AfWidgets_AfAnimatedOpacity}
/// Animating a opacity value by interpolating to the new opacity,
/// a dynamic animation widget using ```AfAnimations.update```
/// or by using ```AfController``` and ```controller.update```, will animate the change.
/// 
/// This widget provides optimal performance by using FadeTransition internally,
/// which is more efficient than regular Opacity widget for animations.
/// {@endtemplate}
///
/// {@macro AfWidgets_howToUse}
///
/// All AfWidgets
/// {@macro AfWidgets_all}
class AfAnimatedOpacity extends StatefulWidget {
  /// {@macro AfWidgets_AfAnimatedOpacity}
  const AfAnimatedOpacity({
    super.key,
    this.controller,
    this.id = "",
    required this.opacity,
    required this.child,
    this.duration,
    this.curve,
    this.onEnd,
    this.alwaysIncludeSemantics = false,
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

  /// The opacity value to update for performing the interpolation animation.
  /// The value must be between 0.0 and 1.0, where 0.0 is completely transparent
  /// and 1.0 is completely opaque.
  /// 
  /// {@macro AfWidgets_whyFunction}
  final double Function() opacity;

  /// Whether the semantic information of the children is always included.
  /// 
  /// When true, the child widget will always be accessible for screen readers,
  /// even when the opacity is 0.0. When false, the child will be ignored by
  /// screen readers when opacity is 0.0.
  final bool alwaysIncludeSemantics;

  /// {@macro AfWidgetOn_initState}
  final void Function()? initState;

  /// {@macro AfWidgetOn_didUpdateWidget}
  final void Function(AfAnimatedOpacity oldWidget)? didUpdateWidget;

  /// {@macro AfWidgetOn_didChangeDependencies}
  final void Function()? didChangeDependencies;

  /// {@macro AfWidgetOn_dispose}
  final void Function()? dispose;

  @override
  State<AfAnimatedOpacity> createState() => _AfAnimatedOpacityState();
}

class _AfAnimatedOpacityState extends _AfWidget<AfAnimatedOpacity> {
  late double opacity;

  @override
  String get id => widget.id;

  @override
  AfController? get controller => widget.controller;

  @override
  _AfWidgetOn<AfAnimatedOpacity> get afWidgetOn {
    return _AfWidgetOn<AfAnimatedOpacity>(
      initState: widget.initState,
      didUpdateWidget: widget.didUpdateWidget,
      didChangeDependencies: widget.didChangeDependencies,
      dispose: widget.dispose,
    );
  }

  @override
  void update() {
    opacity = widget.opacity();
  }

  @override
  Widget build(BuildContext context) {
    return _AfAnimatedOpacity(
      controller: controller,
      opacity: opacity,
      duration: widget.duration ?? widget.controller?.duration ?? AfAnimations.getDuration(context),
      curve: widget.curve ?? widget.controller?.curve ?? AfAnimations.getCurve(context),
      alwaysIncludeSemantics: widget.alwaysIncludeSemantics,
      onEnd: () {
        widget.onEnd?.call();
        AfAnimations.callOnEnd(context);
        controller?.callOnEnd();
      },
      child: widget.child,
    );
  }
}

/// Used exclusively for ```AfAnimatedOpacity```
class _AfAnimatedOpacity extends ImplicitlyAnimatedWidget {
  /// Used exclusively for ```AfAnimatedOpacity```
  const _AfAnimatedOpacity({
    Key? key,
    required this.opacity,
    required this.controller,
    required this.alwaysIncludeSemantics,
    required Curve curve,
    required Duration duration,
    required VoidCallback? onEnd,
    required this.child,
  }) : super(key: key, curve: curve, duration: duration, onEnd: onEnd);

  /// {@macro AfController}
  final AfController? controller;

  /// The opacity value of the animation to update.
  final double opacity;

  /// The widget below this widget in the tree.
  final Widget child;

  /// Whether the semantic information of the children is always included.
  final bool alwaysIncludeSemantics;

  @override
  __AfAnimatedOpacityState createState() => __AfAnimatedOpacityState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<double>('opacity', opacity, defaultValue: null));
    properties
        .add(DiagnosticsProperty<bool>('alwaysIncludeSemantics', alwaysIncludeSemantics, defaultValue: false));
  }
}

class __AfAnimatedOpacityState extends AnimatedWidgetBaseState<_AfAnimatedOpacity> {
  Tween<double>? _opacityTween;
  late Animation<double> _opacityAnimation;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _opacityTween = visitor(_opacityTween, widget.opacity,
            (dynamic value) => Tween<double>(begin: value as double))
        as Tween<double>?;
  }

  @override
  void didUpdateTweens() {
    _opacityAnimation = animation.drive(_opacityTween!);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      alwaysIncludeSemantics: widget.alwaysIncludeSemantics,
      child: widget.child,
    ).afShowRepaint(context, controller: widget.controller);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DiagnosticsProperty<Animation<double>>('opacity', _opacityAnimation));
  }
} 