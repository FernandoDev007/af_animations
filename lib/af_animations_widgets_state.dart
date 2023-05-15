part of 'af_animations.dart';


class _AfAnimationsWidgetsState {

  final String id;
  final String uniqueId;
  final bool Function() mounted;
  final VoidCallback update;

  const _AfAnimationsWidgetsState({
    required this.id,
    required this.uniqueId,
    required this.mounted,
    required this.update,
  });

}

