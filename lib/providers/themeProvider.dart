
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier
{
  ThemeMode _apptheme = ThemeMode.dark;
  ThemeMode get apptheme =>_apptheme;
  ThemeProvider(bool isDark)
  {
    if(isDark)
      {
        _apptheme=ThemeMode.dark;
      }
    else
      {
        _apptheme=ThemeMode.light;
      }
  }
  Future<void> swapthemes ()async
  {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(_apptheme==ThemeMode.light)
    {
      _apptheme=ThemeMode.dark;
      sharedPreferences.setBool('is_dark', true);
    }
    else{
      _apptheme=ThemeMode.light;
      sharedPreferences.setBool('is_dark', false);
    }
    notifyListeners();
  }
  void changetheme(ThemeMode newtheme )
  {
    if(newtheme==apptheme)
    {
      return;
    }
    _apptheme=newtheme;

    notifyListeners();
  }
}