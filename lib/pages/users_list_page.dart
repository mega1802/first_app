import 'package:adding_button/pages/add_user_page.dart';
import 'package:adding_button/pages/user_details_page.dart';
import 'package:flutter/material.dart';

class UsersListPage extends StatefulWidget {
  const UsersListPage({super.key});

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  // Initial content of the list.
  List<String> listName = [
    'List1',
    'List2',
    'List3',
    'List4',
    'List5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Content of List'),
      ),
      body: ListView.builder(
        itemCount: listName.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(listName[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailPage(
                    name: listName[index],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to Page 3 and wait for the result.
          final newItem = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddUserPage()),
          );

          // If a new item is returned, add it to the list.
          if (newItem != null) {
            setState(() {
              listName.add(newItem);
            });
          }
        },
        child: Icon(Icons.add),
        tooltip: 'Add New Item',
        //text that displays over button action
      ),
    );
  }
}
