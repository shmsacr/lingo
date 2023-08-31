import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lingo/data/model/settings.dart';

final settingProvider = ChangeNotifierProvider<SettingsData>((ref) {
  return SettingsData();
});

class SettingsData with ChangeNotifier {
  late Box<Settings> _settings;
  final String boxName = "settings_box";

  Future<void> openBox() async {
    _settings = await Hive.openBox<Settings>(boxName);
  }

  bool _themeMode = false;
  bool _soundOn = false;
  bool _notification = false;
  int _fontSize = 0;
  int _sorting = 0;

  bool get themeMode => _themeMode;
  bool get soundOn => _soundOn;
  bool get notification => _notification;
  int get fontSize => _fontSize;
  int get sorting => _sorting;

  void toggleTheme() async {
    _themeMode = !_themeMode;
    await updateSetting(
        "themeMode",
        Settings(
            themeMode: _themeMode,
            soundOn: _soundOn,
            notification: _notification,
            fontSize: _fontSize,
            sorting: _sorting));
    notifyListeners();
  }

  void toggleSound() async {
    _soundOn = !_soundOn;
    await updateSetting(
        "soundOn",
        Settings(
            themeMode: _themeMode,
            soundOn: _soundOn,
            notification: _notification,
            fontSize: _fontSize,
            sorting: _sorting));
    notifyListeners();
  }

  void toggNotification() async {
    _notification = !_notification;
    await updateSetting(
        "notification",
        Settings(
            themeMode: _themeMode,
            soundOn: _soundOn,
            notification: _notification,
            fontSize: _fontSize,
            sorting: _sorting));
    notifyListeners();
  }

  void toggleMyFontSize(int myFontSize) async {
    _fontSize = myFontSize;
    await updateSetting(
        "fontSize",
        Settings(
            themeMode: _themeMode,
            soundOn: _soundOn,
            notification: _notification,
            fontSize: _fontSize,
            sorting: _sorting));
    notifyListeners();
  }

  void toggleSorting(int mySorting) async {
    _sorting = mySorting;
    await updateSetting(
        "sorting",
        Settings(
            themeMode: _themeMode,
            soundOn: _soundOn,
            notification: _notification,
            fontSize: _fontSize,
            sorting: _sorting));
    notifyListeners();
  }

  Future<void> updateSetting(String key, Settings item) async {
    await openBox();
    await _settings.put(key, item);
    await _settings.close();
  }

  Future<void> loadSettingHive() async {
    await openBox();
    _themeMode = await _settings.get("themeMode")?.themeMode ?? false;
    _soundOn = await _settings.get("soundOn")?.soundOn ?? false;
    _notification = await _settings.get("notification")?.notification ?? false;
    _fontSize = await _settings.get("fontSize")?.fontSize ?? 0;
    _sorting = await _settings.get("sorting")?.sorting ?? 0;
    await _settings.close();
  }
}
