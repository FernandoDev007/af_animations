part of '../af_animations.dart';


class AfAnimatedClipRRect extends StatefulWidget {

  final String id;
  final BorderRadius Function() borderRadius;
  final Duration? duration;
  final CustomClipper<RRect>? clipper;
  final Curve? curve;
  final Clip clipBehavior;
  final VoidCallback? onEnd;
  final Widget child;

  const AfAnimatedClipRRect({
    super.key,
    this.id = "",
    required this.borderRadius,
    this.clipBehavior = Clip.antiAlias,
    this.clipper,
    this.duration,
    this.curve,
    this.onEnd,
    required this.child,
  });

  @override
  State<AfAnimatedClipRRect> createState() => _AfAnimatedClipRRectState();

}

class _AfAnimatedClipRRectState extends State<AfAnimatedClipRRect> {

  late _AfAnimationsWidgetsState state;
  late BorderRadius borderRadius;

  @override
  void initState() {
    if (AfAnimations.existsAncestor(context)) {
      state = _AfAnimationsWidgetsState(
        id: widget.id,
        uniqueId: "AfAnimatedClipRRect-I${widget.id}${AfAnimations._getIdentifier}",
        mounted: () => mounted,
        update: () {
          if (mounted) {
            borderRadius = widget.borderRadius();
            setState(() {});
          }
        },
      );

      AfAnimations._subscription(context, state);
    }
    borderRadius = widget.borderRadius();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AfAnimatedClipRRect oldWidget) {
    if (AfAnimations.existsAncestor(context) && mounted) {
      AfAnimations._unsubscribe(context, state);

      state = _AfAnimationsWidgetsState(
        id: widget.id,
        uniqueId: "AfAnimatedClipRRect-I${widget.id}${AfAnimations._getIdentifier}",
        mounted: () => mounted,
        update: () {
          if (mounted) {
            borderRadius = widget.borderRadius();
            setState(() {});
          }
        },
      );

      AfAnimations._subscription(context, state);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return _AfAnimatedClipRRect(
      duration: widget.duration ?? AfAnimations.getDuration(context),
      curve: widget.curve ?? AfAnimations.getCurve(context),
      borderRadius: borderRadius,
      clipBehavior: widget.clipBehavior,
      clipper: widget.clipper,
      onEnd: () {
        widget.onEnd?.call();
        AfAnimations.callOnEnd(context);
      },
      child: widget.child,
    );
  }

}



class _AfAnimatedClipRRect extends ImplicitlyAnimatedWidget {

  final BorderRadius borderRadius;
  final CustomClipper<RRect>? clipper;
  final Clip clipBehavior;
  final Widget child;

  const _AfAnimatedClipRRect({
    Key? key,
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
    final Animation<double> animation = this.animation;

    return ClipRRect(
      borderRadius: _borderRadiusTween?.evaluate(animation),
      clipBehavior: widget.clipBehavior,
      clipper: widget.clipper,
      child: widget.child,
    ).showRepaint(context);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DiagnosticsProperty<BorderRadiusTween>('borderRadius', _borderRadiusTween, defaultValue: null));
  }

}

