part of 'af_animations.dart';


/// {@template AfController}
/// The alternative to AfAnimations without context, for those suffering from "Contextphobia"...
/// The AfController is used to set the duration, curve, and other animations
/// for a specified group of AfWidgets.
/// 
/// AfAnimations is easier and simpler to use in the application,
/// but AfController is a context-free alternative.
/// I assure you that each one has different use cases,
/// and it will be up to your preference to choose between them.
/// {@endtemplate}
/// 
/// If you find any errors, please let me know by starting a new discussion or PR :)
/// https://github.com/FernandoDev007/af_animations
/// 
/// {@template AfController_examples}
/// ### Examples:
/// ```dart
/// class HomePage extends StatefulWidget {
///   const HomePage({super.key});
/// 
///   @override
///   State<HomePage> createState() => _HomePageState();
/// }
/// 
/// class _HomePageState extends State<HomePage> {
/// 
///   AfController controller = AfController();
///   int valueToAnimated = 0;
/// 
///   @override
///   Widget build(BuildContext context) {
///     /// You can also add it to a specific screen to apply it only screen
///     return Scaffold(
///       appBar: AppBar(),
///       body: AfWidget( // Any widget from this library
///         controller: controller,
///         /// Identifier, it can be used in more than one AfWidget,
///         /// and by calling controller.update(ids: ["identifier group data"]),
///         /// it will update all of them with the same identifier
///         id: "identifier group data",
///         value: () => valueToAnimated,
///         child: SizedBox(
///           height: 150,
///           width: 150,
///         ),
///       ),
///     );
///   }
/// }
/// 
/// ```
/// {@endtemplate}
/// 
/// {@template AfController_principalGetters}
/// Afterwards, in your project, you will be able to retrieve the specified values as follows:
/// ```dart
/// /// The controller is already defined previously
/// AfController controller = AfController();
/// 
/// Duration globalDuration = controller.getDuration();
/// Curve globalCurve = controller.getCurve();
/// bool showRepaint = controller.isShowRepaint();
/// ```
/// {@endtemplate}
/// 
/// {@template AfController_allGetters}
/// You can also use these others:
/// ```dart
/// /// The controller is already defined previously
/// AfController controller = AfController();
/// 
/// /// If for any reason you want to use it.
/// controller.callOnEnd();
/// /// Update all AfWidgets without a specified ID.
/// controller.update();
/// /// You specify the IDs to update, and it will update the widget entirely in an optimal way.
/// controller.update(ids: ["updateIcon", "updateValue", "Anothers"]);
/// ```
/// {@endtemplate}
/// 
/// These functions will work in these AfWidgets
/// {@macro AfWidgets_all}
class AfController {

  /// {@macro AfController}
  /// {@macro AfController_examples}
  /// {@macro AfController_principalGetters}
  /// {@macro AfController_allGetters}
  AfController({
    this.duration,
    this.curve,
    this.onEnd,
    this.showRepaint = false,
  });

  /// {@template AfController_duration}
  /// The global duration over which the AfWidgets will be animated.
  /// 
  /// {@macro AfController_principalGetters}
  /// {@endtemplate}
  final Duration? duration;

  /// {@template AfController_curve}
  /// The global curve over which the AfWidgets will be animated.
  /// 
  /// {@macro AfController_principalGetters}
  /// {@endtemplate}
  final Curve? curve;

  /// {@template AfController_onEnd}
  /// Called every time an animation completes.
  ///
  /// This can be useful to trigger additional actions (e.g. another animation)
  /// at the end of the current animation.
  /// {@endtemplate}
  final void Function()? onEnd;

  /// {@template AfController_showRepaint}
  /// If the showRepaint widget extension is set to true
  /// (You can use it in your current project to perform performance tests),
  /// all widget rebuilds will be visually displayed, making it easier to identify areas
  /// where performance can be improved, by avoiding unnecessary rebuilds.
  /// 
  /// A border of a specific color will be displayed, which will change when a widget rebuild occurs.
  /// 
  /// {@macro AfController_principalGetters}
  /// {@endtemplate}
  final bool showRepaint;


  /// The list where all _AfWidgetState are stored to be updated later with AfAnimations.update.
  final List<_AfWidgetState> _afWidgetStates = <_AfWidgetState>[];


  /// {@macro AfController_principalGetters}
  Duration getDuration() {
    return duration ?? AfAnimations._defaultDuration;
  }

  /// {@macro AfController_principalGetters}
  Curve getCurve() {
    return curve ?? AfAnimations._defaultCurve;
  }

  /// {@macro AfController_principalGetters}
  bool isShowRepaint() {
    return showRepaint;
  }

  /// {@macro AfController_allGetters}
  void callOnEnd() {
    onEnd?.call();
  }

  /// {@macro AfController_allGetters}
  void update({List<String> ids = const <String>[""]}) {
    for (_AfWidgetState afWidget in _afWidgetStates) {
      if (ids.any((id) => afWidget.id == id)) {
        if (afWidget.mounted()) {
          afWidget.update();
        }
      }
    }
  }



  /// {@template AfController_subscription}
  /// Subscribe a _AfWidgetState to listen for a possible [controller.update]
  /// to update the widget and make the respective changes
  /// {@endtemplate}
  void _subscription(_AfWidgetState state) {
    _unsubscribeOnDisposedStates();
    _afWidgetStates.add(state);
  }

  /// {@template AfController_unsubscribe}
  /// Cancel the subscription of a _AfWidgetState when it's not possible to listen
  /// for [controller.update], thus freeing up some resources
  /// {@endtemplate}
  void _unsubscribe(_AfWidgetState state) {
    _afWidgetStates.removeWhere(
      (afWidget) => afWidget.uniqueId == state.uniqueId
    );
  }

  /// Unsubscribe all _AfWidgetState for AfWidgets that are no longer displayed
  /// on the current screen. If they become visible again, they will be subscribed again.
  void _unsubscribeOnDisposedStates() {
    _afWidgetStates.removeWhere(
      (afWidget) => !afWidget.mounted(),
    );
  }

}

