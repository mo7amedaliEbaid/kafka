

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:kafka/manager/cubit.dart';
import 'package:kafka/models/book_model.dart';
import 'package:kafka/screens/dashboard/dashboard.dart';
import 'package:kafka/screens/splash/splash.dart';

import 'package:provider/provider.dart';
import 'configs/core_theme.dart' as theme;

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
      ],
      child: MaterialChild(),
    );
  }
}

class MaterialChild extends StatelessWidget {
  const MaterialChild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'kafka',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: theme.themeLight,
      darkTheme: theme.themeDark,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/dashboard': (context) => const DashboardScreen(),
      },
    );
  }
}
