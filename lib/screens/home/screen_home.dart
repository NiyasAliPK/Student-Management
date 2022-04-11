import 'package:flutter/material.dart';
import 'package:hive_practice/db/functions/db_functions.dart';
import 'package:hive_practice/screens/home/screen_add.dart';
import 'package:hive_practice/screens/home/screen_updater.dart';

import '../../db/model/data_model.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 26, 26),
      appBar: AppBar(),
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: studentlistNotifier,
        builder:
            (BuildContext ctx, List<Studentmodel> studentList, Widget? child) {
          return ListView.separated(
              itemBuilder: (ctx, index) {
                final data = studentList[index];
                int count = index + 1;
                return ListTile(
                  leading: Text(count.toString()),
                  title: Text(data.name),
                  trailing: Text('age   :  ${data.age}'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (ctx) => ScreenProfile(
                              name: data.name,
                              age: data.age,
                              admissionNumber: data.admissionNumber,
                              std: data.std,
                              parentName: data.parentName,
                              place: data.place)),
                    );
                  },
                );
              },
              separatorBuilder: (ctx, index) {
                return const Divider();
              },
              itemCount: studentList.length);
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) {
                return ScreenAdding();
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
