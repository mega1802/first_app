import 'package:flutter/material.dart';

class AddUserPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

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
                Navigator.pop(context, _controller.text);
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
