import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../firebase_utils.dart';
import '../model/task.dart';

class AppConfigProvider extends ChangeNotifier {
  String _applanguage = 'ar';
  String get appLanguage => _applanguage;
  DateTime selectedDate = DateTime.now();
  List<Task> taskList = [];
  getALlTasksFromFireStore() async {
    QuerySnapshot<Task> querySnapshot = await getTaskCollection().get();
    taskList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();


      taskList = taskList.where((task) {
      DateTime taskdate = DateTime.fromMillisecondsSinceEpoch(task.date);
      if (selectedDate.day == taskdate.day &&
          selectedDate.month == taskdate.month &&
          selectedDate.year == taskdate.year)
        return true;

      return false;
    }).toList();

      taskList.sort((Task task1, Task task2)
    {
      DateTime date1=DateTime.fromMillisecondsSinceEpoch(task1.date);
      DateTime date2=DateTime.fromMillisecondsSinceEpoch(task1.date);
      return date1.compareTo(date2);
      });
    notifyListeners();
  }

  void setNewSelectedDate(DateTime neweDate) {
    selectedDate = neweDate;
    getALlTasksFromFireStore();
  }

  AppConfigProvider(String isLanguage) {
    if (isLanguage == 'en') {
      _applanguage = isLanguage;
      print(isLanguage);
      print(appLanguage);
    } else if (isLanguage == 'ar') {
      _applanguage = isLanguage;
      print(isLanguage);
    }
  }
  Future<void> swapLanguages() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (_applanguage == 'en') {
      _applanguage = 'ar';
      sharedPreferences.setString('Ar', appLanguage);
    } else if (_applanguage == 'ar') {
      _applanguage = 'en';
      sharedPreferences.setString('Ar', appLanguage);
    }
    notifyListeners();
  }

  void changeLanguage(String newLanguage) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (newLanguage == _applanguage) {
      return;
    }
    _applanguage = newLanguage;
    sharedPreferences.setString('Ar', _applanguage);
    notifyListeners();
  }
}
