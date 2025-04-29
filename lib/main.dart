import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/application/auth_provider.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    // Firebase will be initialized later when we have proper configuration
    final prefs = await SharedPreferences.getInstance();
    runApp(MyApp(prefs: prefs));
  } catch (e) {
    debugPrint('Error initializing app: $e');
    rethrow;
  }
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  const MyApp({Key? key, required this.prefs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppAuthProvider(prefs),
        ),
      ],
      child: MaterialApp.router(
        title: 'PulmoFit',
        theme: AppTheme.theme,
        routerConfig: createRouter(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
