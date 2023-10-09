import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lingo/controller/riverpod/settings_controller.dart';
import 'package:lingo/controller/router/auto_router_controller.dart';
import 'package:lingo/view/screens/dashboard.dart';
import 'package:lingo/view/theme/custom_theme.dart';

import 'data/model/settings.dart';
import 'data/model/word_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WordsAdapter());
  Hive.registerAdapter(SettingsAdapter());
  await SettingsData().loadSettingHive();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(settingProvider).loadSettingHive();
    bool themeMode = ref.watch(settingProvider).themeMode;
    final _appRouter = AppRouter();
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      theme:
          themeMode ? CustomAppTheme().themeDark : CustomAppTheme().themeLight,
      debugShowCheckedModeBanner: false,
      builder: (_, router) {
        return Navigator(
          pages: [
            MaterialPage(
              child: Scaffold(
                body: router,
                bottomNavigationBar: DashboardScreen(),
              ),
            ),
          ],
          onPopPage: (route, result) => route.didPop(result),
        );
      },
    );
  }
}
