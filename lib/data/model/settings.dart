import 'package:hive/hive.dart';

part 'settings.g.dart';

@HiveType(typeId: 1)
class Settings extends HiveObject {
  // ignore: invalid_annotation_target
  @HiveField(0)
  final bool themeMode;
  @HiveField(1)
  final bool notification;
  @HiveField(2)
  final int fontSize;
  @HiveField(3)
  final int sorting;

  Settings(
      {required this.themeMode,
      required this.notification,
      required this.fontSize,
      required this.sorting});
}
