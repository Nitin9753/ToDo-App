import 'package:flutter/material.dart';
import 'package:newtodo/widgets/todo.dart';

class ToDoitem extends StatelessWidget {
  final ToDo todo;
  final isChanged;
  final delete;
  ToDoitem({required this.todo,required this.isChanged,required
    this.delete, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
      ),
      padding: const EdgeInsets.only(
        top: 20.0,
        bottom: 20.0,
        right: 10.0,
        left: 10.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: null,
        border: Border.all(
          color: Colors.transparent,
        ),
      ),
      child: ListTile(
        onTap:isChanged,

        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank_rounded,
          color: Colors.deepPurpleAccent,
        ),
        title: Text(
          todo.content,
          style: const TextStyle(

            fontSize: 18.0,
            color: Colors.black,
          ),
        ),
        trailing: GestureDetector(
          onTap: delete,
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
