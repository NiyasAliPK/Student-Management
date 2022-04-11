import 'package:flutter/cupertino.dart';
import 'package:hive_practice/db/model/data_model.dart';

ValueNotifier<List<Studentmodel>> studentlistNotifier = ValueNotifier([]);

void addStudent(Studentmodel value) {
  studentlistNotifier.value.add(value);
  studentlistNotifier.notifyListeners();
}
