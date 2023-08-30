import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lingo/data/model/settings.dart';

final settingProvider = ChangeNotifierProvider<SettingsData>((ref) {
  return SettingsData();
});

class SettingsData with ChangeNotifier {
  Box<Settings>? _settings;
  final String boxName = "settings_box";

  SettingsData() {
    openBox();
  }
  Future<void> openBox() async {
    _settings = await Hive.openBox<Settings>(boxName);
  }

  bool _themeMode = false;
  bool _soundOn = false;
  bool _notification = false;
  String _fontSize = "mid";

  bool get themeMode => _themeMode;
  bool get soundOn => _soundOn;
  bool get notification => _notification;
  String get myFontSize => _fontSize;

  void toogleTheme() {
    _themeMode = !_themeMode;
    updateSetting(
        _themeMode, Settings(_themeMode, _soundOn, _notification, _fontSize));
    notifyListeners();
  }

  void toogleSound() {
    _soundOn = !_soundOn;
    updateSetting(
        _soundOn, Settings(_themeMode, _soundOn, _notification, _fontSize));
    notifyListeners();
  }

  void toogNotification() {
    _notification = !_notification;
    updateSetting(_notification,
        Settings(_themeMode, _soundOn, _notification, _fontSize));
    notifyListeners();
  }

  void toogleMyFontSize(String myFontSize) {
    _fontSize = myFontSize;
    updateSetting(
        _fontSize, Settings(_themeMode, _soundOn, _notification, _fontSize));
    notifyListeners();
  }

  Future<void> updateSetting(dynamic key, Settings item) async {
    openBox();
    await _settings?.put(key, item);
    await _settings?.close();
  }

  Future<void> loadSettingHive() async {
    openBox();
    _themeMode = _settings?.get("themeMode")?.themeMode ?? false;
    _soundOn = _settings?.get("soundOn")?.soundOn ?? false;
    _notification = _settings?.get("notification")?.notification ?? false;
    _fontSize = _settings?.get("fontSize")?.fontSize ?? "mid";
    await _settings?.close();
  }
}
