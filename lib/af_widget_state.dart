part of 'af_animations.dart';


/// Each of the AfWidgets in this package internally uses _AfWidgetState
/// so that their ancestor can control their state, update them, and trigger actions accordingly.
/// 
/// In these AfWidgets, it is used:
/// {@template AfWidgets_all}
/// ```dart
/// · AfAnimatedClipRRect
/// ```
/// New AfWidgets will be added in the future. Do you have an idea? You can suggest it to me or open a pull request :)
/// {@endtemplate}
/// 
/// {@template AfWidgets_howToUse}
/// ## How to use
/// Here's a brief explanation on how to use an AfWidget. I'll do my best to explain it
/// 
/// ### Without specifying an Id:
/// ```dart
/// ...
/// /// 'AfWidget' would be the widget you are currently using
/// AfWidget(
///   /// 'value' would be the value that is being requested
///   value: () => valueToChanged,
///   child: ...
/// ),
/// ...
/// ```
/// 
/// In order to animate the changes, first the value needs to be changed and updated
/// ```dart
/// ...
/// /// Change the value.
/// if (anyValidation) {
///   valueToChanged = 2000;
/// } else {
///   valueToChanged = 500;
/// }
/// /// Notify the widget of the update
/// AfAnimations.update(context);
/// ...
/// ```
/// ### Specifying an Id:
/// ```dart
/// ...
/// /// 'AfWidget' would be the widget you are currently using
/// AfWidget(
///   /// 'id' It doesn't need to be unique,
///   /// it can be in groups, and they will be updated
///   id: "size cover photo",
///   /// 'value' would be the value that is being requested
///   value: () => valueToChanged,
///   child: ...
/// ),
/// ...
/// ```
/// 
/// In order to animate the changes, first the value needs to be changed and updated
/// ```dart
/// ...
/// /// Change the value.
/// if (anyValidation) {
///   valueToChanged = 2000;
/// } else {
///   valueToChanged = 500;
/// }
/// /// Notify the widget of the update
/// AfAnimations.update(context, ids: ["size cover photo"]);
/// ...
/// ```
/// 
/// As an additional note, you can update multiple AfWidgets
/// at the same time by specifying their ids in the mentioned function.
/// ```dart
/// ...
/// /// Notifies the change to all specified widgets.
/// AfAnimations.update(
///   context,
///   ids: [
///     "size cover photo",
///     "profile photo",
///     "information",
///     "follows",
///   ]
/// );
/// ...
/// ```
/// I hope you were able to understand
/// {@endtemplate}
/// 
/// 
/// 
/// Now we will explain what each of the values will do.
/// 
/// ### Id
/// {@template AfWidgets_id}
/// The ```id``` identifier is used to differentiate them from other AfWidgets. By default,
/// if you perform ```AfAnimations.update(context)```, all AfWidgets with unspecified ids will be updated
/// 
/// If you specify an id, for example ```id: 'profile picture'```, when updating,
/// use ```AfAnimations.update(context, ids: ['profile picture'])```.
/// This way, only this specific AfWidget will be updated
/// 
/// It is recommended to specify the id in each of the AfAnimations,
/// especially if they will be updated frequently. However,
/// it is not a problem if the id is left empty or if multiple AfWidgets use the same id,
/// as long as you are aware of the implications and understand what you are doing
/// {@endtemplate}
/// 
/// ### Duration
/// {@template AfWidgets_duration}
/// The ```duration``` of the animation performed, by default, will take the duration
/// specified in ```AfAnimations.getDuration(context)```,
/// of course, it is recommended to use the ```AfAnimations``` widget.
/// {@endtemplate}
/// 
/// ### Curve
/// {@template AfWidgets_curve}
/// The ```curve``` of the animation performed, by default, will take the curve
/// specified in ```AfAnimations.getCurve(context)```,
/// of course, it is recommended to use the ```AfAnimations``` widget.
/// {@endtemplate}
/// 
/// {@template AfWidgets_whyFunction}
/// ### Why a function?
/// It was decided to use a function or functions
/// because during testing while developing the package,
/// it was found that this is the only way to obtain updated data
/// every time AfAnimations.update is used. If it is not used, it will not work.
/// I recommend using ```() =>```.
/// {@endtemplate}
class _AfWidgetState {

  /// Used only for AfWidgets
  /// {@macro AfWidgets_all}
  const _AfWidgetState({
    required this.id,
    required this.uniqueId,
    required this.mounted,
    required this.update,
  });

  /// Specified identifier
  final String id;

  /// Internal identifier to control the state of each AfWidget"
  final String uniqueId;

  /// Determine if the AfWidget is still visible on the screen
  final bool Function() mounted;

  /// Update the AfWidget from its ancestor
  final VoidCallback update;

}

