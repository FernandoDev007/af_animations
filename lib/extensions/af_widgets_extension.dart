part of '../af_animations.dart';


/// Extensions that will be used in AfWidgets, although you can also use them.
extension AfWidgetsExtension on Widget {

  /// {@macro AfAnimations_showRepaint}
  Widget afShowRepaint(
    BuildContext context, {
    AfAnimationsController? controller
  }) {
    if (controller?.isShowRepaint() ?? AfAnimations.isShowRepaint(context) ?? true) {
      List<MaterialColor> colors = Colors.primaries;
      Random random = Random();

      return Container(
        foregroundDecoration: BoxDecoration(
          border: Border.all(
            width: 3.75,
            color: colors[random.nextInt(colors.length)],
          ),
        ),
        child: this,
      );
    } else {
      return this;
    }
  }

}

