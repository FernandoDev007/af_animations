part of '../af_animations.dart';

/// {@template AfWidgets_AfBuilder}
/// The ```Builder``` version, which has ```AfWidget``` implemented inside,
/// updates the widget easily and using ```AfAnimations.update```
/// or by using ```AfController``` and ```controller.update```,
/// whichever is easier for you...
/// {@endtemplate}
///
/// {@macro AfWidgets_howToUse}
///
/// All AfWidgets
/// {@macro AfWidgets_all}
class AfBuilder extends StatefulWidget {
  /// {@macro AfWidgets_AfBuilder}
  const AfBuilder({
    super.key,
    this.controller,
    this.id = "",
    this.child,
    required this.builder,
    this.initState,
    this.didUpdateWidget,
    this.didChangeDependencies,
    this.dispose,
  });

  /// {@macro AfController}
  final AfController? controller;

  /// {@macro AfWidgets_id}
  final String id;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget? child;

  /// Called to obtain the child widget.
  ///
  /// This function is called whenever this widget is included in its parent's
  /// build and the old widget (if any) that it synchronizes with has a distinct
  /// object identity. Typically the parent's build method will construct
  /// a new tree of widgets and so a new Builder child will not be [identical]
  /// to the corresponding old one.
  final Widget Function(BuildContext context, Widget? child) builder;

  /// {@macro AfWidgetOn_initState}
  final void Function()? initState;

  /// {@macro AfWidgetOn_didUpdateWidget}
  final void Function(AfBuilder oldWidget)? didUpdateWidget;

  /// {@macro AfWidgetOn_didChangeDependencies}
  final void Function()? didChangeDependencies;

  /// {@macro AfWidgetOn_dispose}
  final void Function()? dispose;

  @override
  State<AfBuilder> createState() => _AfBuilderState();
}

class _AfBuilderState extends _AfWidget<AfBuilder> {
  @override
  String get id => widget.id;

  @override
  AfController? get controller => widget.controller;

  @override
  _AfWidgetOn<AfBuilder> get afWidgetOn {
    return _AfWidgetOn<AfBuilder>(
      initState: widget.initState,
      didUpdateWidget: widget.didUpdateWidget,
      didChangeDependencies: widget.didChangeDependencies,
      dispose: widget.dispose,
    );
  }

  @override
  void update() {}

  @override
  Widget build(BuildContext context) {
    return widget.builder.call(context, widget.child);
  }
}
