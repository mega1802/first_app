import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NameListPage(),
    );
  }
}

class NameListPage extends StatefulWidget {
  @override
  _NameListPageState createState() => _NameListPageState();
}

class _NameListPageState extends State<NameListPage> {
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
                  builder: (context) => NameDetailPage(
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
            MaterialPageRoute(builder: (context) => AddItemPage()),
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

class NameDetailPage extends StatelessWidget {
  final String name;

  NameDetailPage({required this.name});

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

class AddItemPage extends StatelessWidget {
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

