import 'package:flutter/material.dart';
import 'package:hive_practice/db/functions/db_functions.dart';
import 'package:hive_practice/db/model/data_model.dart';

class ScreenAdding extends StatelessWidget {
  ScreenAdding({Key? key}) : super(key: key);

  final _nameFromController = TextEditingController();
  final _ageFromController = TextEditingController();
  final _adNoFromController = TextEditingController();
  final _stdFromController = TextEditingController();
  final _parentFromController = TextEditingController();
  final _placeFromController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _nameFromController,
                  decoration: const InputDecoration(
                    label: Text('Name'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _ageFromController,
                  decoration: const InputDecoration(
                    label: Text('Age'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _adNoFromController,
                  decoration: const InputDecoration(
                    label: Text('Admission Number'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _stdFromController,
                  decoration: const InputDecoration(
                    label: Text('Class'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _parentFromController,
                  decoration: const InputDecoration(
                    label: Text('Parent Name'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _placeFromController,
                  decoration: const InputDecoration(
                    label: Text('Place'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  submission(context);
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Student'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void clear() async {
    await Future.delayed(const Duration(milliseconds: 2500));
    _nameFromController.clear();
    _ageFromController.clear();
    _adNoFromController.clear();
    _stdFromController.clear();
    _parentFromController.clear();
    _placeFromController.clear();
  }

  void submission(BuildContext context) async {
    final _name = _nameFromController.text;
    final _age = _ageFromController.text;
    final _admn = _adNoFromController.text;
    final _std = _stdFromController.text;
    final _parent = _parentFromController.text;
    final _place = _placeFromController.text;

    if (_name.isEmpty ||
        _age.isEmpty ||
        _admn.isEmpty ||
        _std.isEmpty ||
        _parent.isEmpty ||
        _place.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Padding(
            padding: EdgeInsets.only(left: 50),
            child: Text('Please fill all six fields to add student.'),
          ),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      final _student = Studentmodel(
          name: _name,
          age: _age,
          admissionNumber: _admn,
          std: _std,
          parentName: _parent,
          place: _place);
      addStudent(_student);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Padding(
          padding: EdgeInsets.only(left: 90),
          child: Text('Student added Succesfully.'),
        ),
        backgroundColor: Colors.greenAccent[400],
      ));

      clear();
    }
  }
}
