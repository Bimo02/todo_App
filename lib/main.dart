import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamiapp/providers/app_config_provider.dart';
import 'package:islamiapp/providers/themeProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home/homeScreen.dart';
import 'Theme Data/my_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final isDark =sharedPreferences.getBool('is_dark') ?? false;
  final isLanguage = sharedPreferences.getString('Ar')??'';
  print(isLanguage);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=> AppConfigProvider(isLanguage)),
    ChangeNotifierProvider(create: (context) => ThemeProvider(isDark)),
  ], child: MyApp(isDark: isDark, isLanguage: isLanguage,)));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  final String isLanguage;
  MyApp({required this.isDark , required this.isLanguage});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var providerTH = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darktheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
      themeMode: providerTH.apptheme,
    );
  }
}
