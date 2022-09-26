import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  int _selectedIndex = 0;
  final List<Todo> _todos = <Todo>[];
  final TextEditingController _textFieldController = TextEditingController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_sharp),
            label: 'Notas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Fotos',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: 50, left: 100),
                alignment: Alignment.topCenter,
                child: Text(
                  "Colegio Jefferson",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 40.5),
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.menu),
                  iconSize: 30,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 100),
            // ignore: sort_child_properties_last
            child: ListView(
              children: _todos.map((Todo todo) {
                return TodoItem(
                  deleted: _todos,
                  todo: todo,
                  onTodoChanged: _handleTodoChange,
                );
              }).toList(),
            ),
            alignment: Alignment.bottomCenter,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _displayDialog(context),
          tooltip: 'Add Item',
          child: Icon(Icons.add)),
    );
  }

  void _handleTodoChange(Todo todo) {
    setState(() {
      todo.checked = !todo.checked;
    });
  }

  void _addTodoItem(String name) {
    setState(() {
      _todos.add(Todo(name: name, checked: false));
    });
    _textFieldController.clear();
  }

// Generate a single item widget
  Future<Future> _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add a task to your list'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: 'Enter task here'),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('ADD'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _addTodoItem(_textFieldController.text);
                },
              ),
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}

class Todo {
  Todo({required this.name, required this.checked});
  final String name;
  bool checked;
}

class TodoItem extends StatelessWidget {
  TodoItem({
    required this.todo,
    required this.onTodoChanged,
    required this.deleted,
  }) : super(key: ObjectKey(todo));

  final Todo todo;
  final onTodoChanged;
  final List<Todo> deleted;

  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return null;

    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  void deleteTodo(Todo _todoList) {
    deleted.remove(_todoList);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTodoChanged(todo);
      },
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: (() {
          deleteTodo(todo);
        }),
      ),
      title: Text(todo.name, style: _getTextStyle(todo.checked)),
    );
  }
}

  
  

























/*
Future<List<String>> extractData() async {
//Getting the response from the targeted url
    final response = await http.Client()
        .get(Uri.parse('https://class.colegiojefferson.com/quinto-rojo/'));
    //Status Code 200 means response has been received successfully
    if (response.statusCode == 200) {
      //Getting the html document from the response
      var document = parser.parse(response.body);
      try {
        //Scraping the first article title
        var responseString1 = document
            .getElementsByClassName('mc-content')[0]
            .children[0]
            .children[1];
        //.children[1];

        print(responseString1.text.trim());

        //Converting the extracted titles into string and returning a list of Strings
        return [
          responseString1.text.trim(),
        ];
      } catch (e) {
        return ['', '', 'ERROR!'];
      }
    } else {
      return ['', '', 'ERROR: ${response.statusCode}.'];
    }
  }
  */