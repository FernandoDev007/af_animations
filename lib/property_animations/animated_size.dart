part of '../af_animations.dart';

/// {@template AfWidgets_AfAnimatedSize}
/// Animating a size value by interpolating to the new size,
/// a dynamic animation widget using ```AfAnimations.update```
/// or by using ```AfController``` and ```controller.update```, will animate the change.
/// 
/// This widget provides smooth transitions for width and height changes,
/// making it perfect for resizing containers, images, or any widget that needs
/// size-based animations.
/// {@endtemplate}
///
/// {@macro AfWidgets_howToUse}
///
/// All AfWidgets
/// {@macro AfWidgets_all}
class AfAnimatedSize extends StatefulWidget {
  /// {@macro AfWidgets_AfAnimatedSize}
  const AfAnimatedSize({
    super.key,
    this.controller,
    this.id = "",
    required this.size,
    required this.child,
    this.duration,
    this.curve,
    this.onEnd,
    this.alignment = Alignment.center,
    this.clipBehavior = Clip.hardEdge,
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

  /// The size value to update for performing the interpolation animation.
  /// The Size object contains width and height values that will be animated.
  /// 
  /// {@macro AfWidgets_whyFunction}
  final Size Function() size;

  /// How to align the child widget within the animated size container.
  /// 
  /// Defaults to [Alignment.center].
  final AlignmentGeometry alignment;

  /// The clip behavior when the child overflows the animated size.
  /// 
  /// Defaults to [Clip.hardEdge].
  final Clip clipBehavior;

  /// {@macro AfWidgetOn_initState}
  final void Function()? initState;

  /// {@macro AfWidgetOn_didUpdateWidget}
  final void Function(AfAnimatedSize oldWidget)? didUpdateWidget;

  /// {@macro AfWidgetOn_didChangeDependencies}
  final void Function()? didChangeDependencies;

  /// {@macro AfWidgetOn_dispose}
  final void Function()? dispose;

  @override
  State<AfAnimatedSize> createState() => _AfAnimatedSizeState();
}

class _AfAnimatedSizeState extends _AfWidget<AfAnimatedSize> {
  late Size size;

  @override
  String get id => widget.id;

  @override
  AfController? get controller => widget.controller;

  @override
  _AfWidgetOn<AfAnimatedSize> get afWidgetOn {
    return _AfWidgetOn<AfAnimatedSize>(
      initState: widget.initState,
      didUpdateWidget: widget.didUpdateWidget,
      didChangeDependencies: widget.didChangeDependencies,
      dispose: widget.dispose,
    );
  }

  @override
  void update() {
    size = widget.size();
  }

  @override
  Widget build(BuildContext context) {
    return _AfAnimatedSize(
      controller: controller,
      size: size,
      duration: widget.duration ?? widget.controller?.duration ?? AfAnimations.getDuration(context),
      curve: widget.curve ?? widget.controller?.curve ?? AfAnimations.getCurve(context),
      alignment: widget.alignment,
      clipBehavior: widget.clipBehavior,
      onEnd: () {
        widget.onEnd?.call();
        AfAnimations.callOnEnd(context);
        controller?.callOnEnd();
      },
      child: widget.child,
    );
  }
}

/// Used exclusively for ```AfAnimatedSize```
class _AfAnimatedSize extends ImplicitlyAnimatedWidget {
  /// Used exclusively for ```AfAnimatedSize```
  const _AfAnimatedSize({
    Key? key,
    required this.size,
    required this.controller,
    required this.alignment,
    required this.clipBehavior,
    required Curve curve,
    required Duration duration,
    required VoidCallback? onEnd,
    required this.child,
  }) : super(key: key, curve: curve, duration: duration, onEnd: onEnd);

  /// {@macro AfController}
  final AfController? controller;

  /// The size value of the animation to update.
  final Size size;

  /// The widget below this widget in the tree.
  final Widget child;

  /// How to align the child widget within the animated size container.
  final AlignmentGeometry alignment;

  /// The clip behavior when the child overflows the animated size.
  final Clip clipBehavior;

  @override
  __AfAnimatedSizeState createState() => __AfAnimatedSizeState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<Size>('size', size, defaultValue: null));
    properties
        .add(DiagnosticsProperty<AlignmentGeometry>('alignment', alignment, defaultValue: Alignment.center));
    properties
        .add(EnumProperty<Clip>('clipBehavior', clipBehavior, defaultValue: Clip.hardEdge));
  }
}

class __AfAnimatedSizeState extends AnimatedWidgetBaseState<_AfAnimatedSize> {
  SizeTween? _sizeTween;
  late Animation<Size?> _sizeAnimation;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _sizeTween = visitor(_sizeTween, widget.size,
            (dynamic value) => SizeTween(begin: value as Size))
        as SizeTween?;
  }

  @override
  void didUpdateTweens() {
    _sizeAnimation = animation.drive(_sizeTween!);
  }

  @override
  Widget build(BuildContext context) {
    final Size? animatedSize = _sizeAnimation.value;
    
    return SizedBox(
      width: animatedSize?.width,
      height: animatedSize?.height,
      child: ClipRect(
        clipBehavior: widget.clipBehavior,
        child: Align(
          alignment: widget.alignment,
          child: widget.child,
        ),
      ),
    ).afShowRepaint(context, controller: widget.controller);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DiagnosticsProperty<Animation<Size?>>('size', _sizeAnimation));
  }
} 