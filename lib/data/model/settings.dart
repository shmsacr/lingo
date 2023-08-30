import 'package:hive/hive.dart';

part 'settings.g.dart';

@HiveType(typeId: 1)
class Settings extends HiveObject {
  // ignore: invalid_annotation_target
  @HiveField(0, defaultValue: false)
  final bool themeMode;
  @HiveField(1, defaultValue: true)
  final bool soundOn;
  @HiveField(2, defaultValue: false)
  final bool notification;
  @HiveField(3, defaultValue: "mid")
  final String fontSize;

  Settings(this.themeMode, this.soundOn, this.notification, this.fontSize);
}
