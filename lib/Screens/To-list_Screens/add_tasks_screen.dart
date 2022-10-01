import 'package:colegio_app/Models/todo.dart';
import 'package:colegio_app/Screens/To-list_Screens/to_do_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  final List<ToDo> lis;

  const AddTaskScreen({required this.lis});
  @override
  Widget build(BuildContext context) {
    TextEditingController prueba = TextEditingController();

    void _addToDoItem(String toDo) {
      lis.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
      prueba.clear();
    }

    return Container(
      color: const Color(0xFF757575),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextFormField(
              controller: prueba,
              autofocus: true,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            MaterialButton(
              onPressed: () {
                _addToDoItem(prueba.text);
                Navigator.of(context).pop();
              },
              color: Colors.blue,
              child: const Text(
                'Add',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              textColor: Colors.white,
              height: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
