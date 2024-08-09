import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class AddNewCommentPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  AddNewCommentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Item'),
      ),
      //body: new Container(
      // margin: new EdgeInsets.symmetric(horizontal: 20.0),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter new item'),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // Return the new item back to the NameListPage.
                Get.back(result: {"newUser": _controller.text});
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
