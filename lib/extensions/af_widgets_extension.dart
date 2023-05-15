part of '../af_animations.dart';


extension AfWidgetsExtension on Widget {

  Widget showRepaint(BuildContext context) {
    if (AfAnimations.isShowRepaint(context) ?? true) {
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

