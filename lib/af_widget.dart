part of 'af_animations.dart';

/// All AfWidgets:
/// {@macro AfWidgets_all}
abstract class _AfWidget<T extends StatefulWidget> extends State<T> {
  /// Used only for AfWidgets
  /// {@macro AfWidgets_all}
  _AfWidgetState? state;

  /// {@macro AfWidgetOn}
  _AfWidgetOn get afWidgetOn;

  /// Check if there is an ancestor AfAnimations and perform an action based on that
  /// {@macro AfAnimations_allGetters}
  bool get existsAncestor =>
      (AfAnimations.existsAncestor(context) || controller != null) && mounted;

  /// {@macro AfWidgets_id}
  String get id;

  /// {@macro AfController}
  /// {@macro AfController_examples}
  /// {@macro AfController_principalGetters}
  /// {@macro AfController_allGetters}
  ///
  /// These functions will work in these AfWidgets
  /// {@macro AfWidgets_all}
  AfController? get controller;

  /// Set to update values
  void update();

  /// {@macro AfAnimations_subscription}
  void subscription() {
    state = _AfWidgetState(
      id: id,
      uniqueId: "${T.toString()}-I$id-${AfAnimations._getIdentifier}",
      mounted: () => mounted,
      update: () {
        update();
        setState(() {});
      },
    );

    if (controller != null) {
      controller!._subscription(state!);
    } else {
      AfAnimations._subscription(context, state!);
    }
  }

  /// {@macro AfAnimations_unsubscribe}
  void unsubscribe() {
    controller?._unsubscribe(state!);
    AfAnimations._unsubscribe(context, state!);
  }

  @override
  void initState() {
    if (existsAncestor) {
      subscription();
      update();
    }
    afWidgetOn.initState?.call();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant T oldWidget) {
    if (existsAncestor) {
      unsubscribe();
      subscription();
    }
    afWidgetOn.didUpdateWidget?.call(oldWidget);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    afWidgetOn.didChangeDependencies?.call();
  }

  @override
  void dispose() {
    afWidgetOn.dispose?.call();
    super.dispose();
  }
}
