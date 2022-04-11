import 'package:flutter/material.dart';

class ScreenProfile extends StatelessWidget {
  final String name;
  final String age;
  final String admissionNumber;
  final String std;
  final String parentName;
  final String place;

  const ScreenProfile(
      {Key? key,
      required this.name,
      required this.age,
      required this.admissionNumber,
      required this.std,
      required this.parentName,
      required this.place})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.amberAccent.shade200, Colors.amber],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Name : $name',
                    style: const TextStyle(fontSize: 25),
                  ),
                  Text(
                    'Age : $age',
                    style: const TextStyle(fontSize: 25),
                  ),
                  Text(
                    'Admission No : $admissionNumber',
                    style: const TextStyle(fontSize: 25),
                  ),
                  Text(
                    'Class : $std',
                    style: const TextStyle(fontSize: 25),
                  ),
                  Text(
                    'Parent Name : $parentName',
                    style: const TextStyle(fontSize: 25),
                  ),
                  Text(
                    'Place : $place',
                    style: const TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
