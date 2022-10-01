import 'package:colegio_app/Models/todo.dart';
import 'package:colegio_app/Screens/To-list_Screens/add_tasks_screen.dart';
import 'package:colegio_app/Widgets/todo_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class to_doScreen extends StatefulWidget {
  const to_doScreen({super.key});

  @override
  State<to_doScreen> createState() => _to_doScreenState();
}

class _to_doScreenState extends State<to_doScreen> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(children: [
              Container(
                child: Text(
                  "To-do List",
                  style: TextStyle(fontSize: 30),
                ),
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 39),
              ),
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  onChanged: (value) => _runFilter(value),
                  decoration: InputDecoration(
                      fillColor: Colors.blue,
                      labelText: "Search",
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(26.0)))),
                ),
              ),
            ]),
          ),
          Container(
            padding: EdgeInsets.only(top: 160),
            // ignore: sort_child_properties_last
            child: ListView(children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                ),
              ),
              for (ToDo todoo in _foundToDo.reversed)
                ToDoItem(
                  todo: todoo,
                  onToDoChanged: _handleToDoChange,
                  onDeleteItem: _deleteToDoItem,
                ),
            ]),
            alignment: Alignment.bottomCenter,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10, right: 80),
            alignment: Alignment.bottomLeft,
            child: TextFormField(
              decoration: InputDecoration(
                  fillColor: Colors.blue,
                  labelText: "Search",
                  hintText: "Search",
                  disabledBorder: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(26.0)))),
              controller: _todoController,
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 15, bottom: 17),
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                if (!_todoController.text.isEmpty)
                  _addToDoItem(_todoController.text);
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
      _todoController.clear();
    });
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }
}
