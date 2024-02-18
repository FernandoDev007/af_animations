part of '../af_animations.dart';


/// {@template AfWidgets_AfAnimatedClipRRect}
/// The animated version of the ```ClipRRect``` widget,
/// specifying a borderRadius and using ```AfAnimations.update```
/// or by using ```AfController``` and ```controller.update```, will animate the change.
/// 
/// Creates a rounded-rectangular clip.
///
/// The borderRadius defaults to BorderRadius.zero, i.e. a rectangle with
/// right-angled corners.
///
/// If clipper is non-null, then borderRadius is ignored.
///
/// The clipBehavior argument must not be null. If clipBehavior is
/// Clip.none, no clipping will be applied.
/// 
/// ### Recommendations:
/// 
/// - It is recommended to replace the use of AfAnimatedClipRRect with AfAnimatedContainer.
/// In many cases, that's what you will need, and it's more optimized.
/// AfAnimatedClipRRect exists because it can be used in very specific cases,
/// but this version of ClipRRect follows good practices.
/// - I do not recommend using Clip.antiAliasWithSaveLayer.
/// According to the Flutter documentation, it can be expensive to use.
/// Now, imagine animating something like this. However, the decision is up to you.
/// {@endtemplate}
///
/// {@macro AfWidgets_howToUse}
/// 
/// All AfWidgets
/// {@macro AfWidgets_all}
class AfAnimatedClipRRect extends StatefulWidget {

  /// {@macro AfWidgets_AfAnimatedClipRRect}
  const AfAnimatedClipRRect({
    super.key,
    this.controller,
    this.id = "",
    required this.borderRadius,
    this.clipBehavior = Clip.antiAlias,
    this.clipper,
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

  /// The border radius of the rounded corners.
  ///
  /// Values are clamped so that horizontal and vertical radii sums do not
  /// exceed width/height.
  ///
  /// This value is ignored if [clipper] is non-null.}
  /// 
  /// {@macro AfWidgets_whyFunction}
  final BorderRadius Function() borderRadius;

  /// If non-null, determines which clip to use.
  final CustomClipper<RRect>? clipper;

  /// {@macro flutter.rendering.ClipRectLayer.clipBehavior}
  ///
  /// Defaults to [Clip.antiAlias].
  final Clip clipBehavior;

    /// {@macro AfWidgetOn_initState}
  final void Function()? initState;

  /// {@macro AfWidgetOn_didUpdateWidget}
  final void Function(AfAnimatedClipRRect oldWidget)? didUpdateWidget;

  /// {@macro AfWidgetOn_didChangeDependencies}
  final void Function()? didChangeDependencies;

  /// {@macro AfWidgetOn_dispose}
  final void Function()? dispose;

  @override
  State<AfAnimatedClipRRect> createState() => _AfAnimatedClipRRectState();

}

class _AfAnimatedClipRRectState extends _AfWidget<AfAnimatedClipRRect> {

  late BorderRadius _borderRadius;

  @override
  String get id => widget.id;

  @override
  AfController? get controller => widget.controller;

  @override
  _AfWidgetOn<AfAnimatedClipRRect> get afWidgetOn => _AfWidgetOn<AfAnimatedClipRRect>(
    initState: widget.initState,
    didUpdateWidget: widget.didUpdateWidget,
    didChangeDependencies: widget.didChangeDependencies,
    dispose: widget.dispose,
  );

  @override
  void update() {
    _borderRadius = widget.borderRadius();
  }

  @override
  Widget build(BuildContext context) {
    return _AfAnimatedClipRRect(
      controller: controller,
      duration: widget.duration ?? AfAnimations.getDuration(context),
      curve: widget.curve ?? AfAnimations.getCurve(context),
      borderRadius: _borderRadius,
      clipBehavior: widget.clipBehavior,
      clipper: widget.clipper,
      onEnd: () {
        widget.onEnd?.call();
        AfAnimations.callOnEnd(context);
        controller?.callOnEnd();
      },
      child: widget.child ?? const SizedBox.shrink(),
    );
  }

}



/// Used exclusively for ```AfAnimatedClipRRect```
class _AfAnimatedClipRRect extends ImplicitlyAnimatedWidget {

  /// Used exclusively for ```AfAnimatedClipRRect```
  const _AfAnimatedClipRRect({
    Key? key,
    required this.controller,
    required this.borderRadius,
    required this.child,
    required this.clipBehavior,
    required this.clipper,
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

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget child;

  /// The border radius of the rounded corners.
  ///
  /// Values are clamped so that horizontal and vertical radii sums do not
  /// exceed width/height.
  ///
  /// This value is ignored if [clipper] is non-null.}
  /// 
  /// {@macro AfWidgets_whyFunction}
  final BorderRadius borderRadius;

  /// If non-null, determines which clip to use.
  final CustomClipper<RRect>? clipper;

  /// {@macro flutter.rendering.ClipRectLayer.clipBehavior}
  ///
  /// Defaults to [Clip.antiAlias].
  final Clip clipBehavior;

  @override
  __AfAnimatedClipRRectState createState() => __AfAnimatedClipRRectState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<BorderRadius>('borderRadius', borderRadius, defaultValue: null));
  }

}

class __AfAnimatedClipRRectState extends AnimatedWidgetBaseState<_AfAnimatedClipRRect> {

  BorderRadiusTween? _borderRadiusTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _borderRadiusTween = visitor(
      _borderRadiusTween,
      widget.borderRadius,
      (dynamic value) => BorderRadiusTween(begin: value as BorderRadius),
    ) as BorderRadiusTween?;
  }


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: _borderRadiusTween!.evaluate(animation)!,
      clipBehavior: widget.clipBehavior,
      clipper: widget.clipper,
      child: widget.child,
    ).afShowRepaint(context, controller: widget.controller);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DiagnosticsProperty<BorderRadiusTween>('borderRadius', _borderRadiusTween, defaultValue: null));
  }

}

