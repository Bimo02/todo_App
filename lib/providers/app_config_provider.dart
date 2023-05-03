import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  String _applanguage = 'ar';
  String get appLanguage => _applanguage;
  AppConfigProvider(String isLanguage)
  {
   if(isLanguage=='en')
     {
       _applanguage= isLanguage;
       print(isLanguage);
       print(appLanguage);
     }
   else if(isLanguage=='ar')
     {
       _applanguage=isLanguage;
       print(isLanguage);
     }
  }
  Future<void> swapLanguages ()async
  {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(_applanguage=='en')
    {
      _applanguage='ar';
      sharedPreferences.setString('Ar', appLanguage);
    }
    else if (_applanguage=='ar'){
      _applanguage='en';
      sharedPreferences.setString('Ar', appLanguage);
    }
    notifyListeners();
  }
  void changeLanguage(String newLanguage) async  {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (newLanguage == _applanguage) {
      return;
    }
    _applanguage = newLanguage;
    sharedPreferences.setString('Ar', _applanguage);
    notifyListeners();
  }
}
