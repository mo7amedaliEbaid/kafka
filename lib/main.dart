import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:kafka/manager/book_manager/book_cubit.dart';
import 'package:kafka/models/book_model.dart';
import 'package:kafka/responsive/responsive.dart';
import 'package:kafka/screens/dashboard/dashboard.dart';
import 'package:kafka/screens/splash/splash.dart';

import 'package:provider/provider.dart';
import 'configs/core_theme.dart' as theme;
import 'manager/theme_manager/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter<Book>(BookAdapter());

  await Hive.openBox('app');
  await Hive.openBox('booksbox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiProvider(
        providers: [
          BlocProvider(create: (_) => BooksCubit()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ],
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) => MaterialChild(
            themeprovider: themeProvider,
          ),
        ));
  }
}

class MaterialChild extends StatelessWidget {
  final ThemeProvider themeprovider;

  const MaterialChild({
    Key? key,
    required this.themeprovider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'kafka',
      debugShowCheckedModeBanner: false,
      themeMode: themeprovider.isDark ? ThemeMode.dark : ThemeMode.light,
      theme: theme.themeLight,
      darkTheme: theme.themeDark,
      initialRoute: Responsive.isDesktop(context) ? '/dashboard' : '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/dashboard': (context) => const DashboardScreen(),
      },
    );
  }
}
