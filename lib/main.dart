import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lingo/data/services/local_storage.dart';
import 'package:lingo/view/theme/app_theme.dart';
 import 'package:lingo/controller/routes/router.dart' as route;


//D:\FlutterWork\lingo\lib\controller\routes\router.dart
import 'data/model/word_model.dart';
import 'view/theme/custom_theme.dart';

final locator = GetIt.instance;
void setup() {
  locator.registerSingleton<LocalStroge>(HiveLocalStroge());
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WordsAdapter());
  setup();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      initialRoute: route.Router.dashboard,
      onGenerateRoute: route.Router.generateRoute,
      theme: CustomAppTheme().theme,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
     
    );
  }
}
