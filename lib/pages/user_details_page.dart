
import 'package:flutter/material.dart';

class UserDetailPage extends StatelessWidget {
  final String name;

  UserDetailPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Detail'),
      ),
      body: Center(
        child: Text(
          'Your file is present in $name',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
