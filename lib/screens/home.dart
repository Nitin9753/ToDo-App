import 'package:flutter/material.dart';
import 'package:newtodo/todo_item.dart';
import 'package:newtodo/widgets/todo.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ToDo> todoList = ToDo.todoList();
  List<ToDo> founditem = [];
  TextEditingController taskdata = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    founditem = todoList;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFf5f5f5),
        elevation: 0,
        title: appbar_build(),
      ),
      body: Container(
        color: const Color(0xFFf5f5f5),
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 23.0,
                      ),
                      Expanded(
                        // width:double.infinity,
                        child: TextField(
                          onChanged: (value) => _runFilter(value),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                fontSize: 18.0,
                                letterSpacing: 1.5,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              )
                              // hintStyle: TextStyle(
                              //   color: Colors.white30,
                              // )
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: ListView(
                      children: [
                        for (ToDo x in founditem)
                          ToDoitem(
                            todo: x,
                            isChanged: () {
                              setState(() {
                                x.isDone = !x.isDone;
                              });
                            },
                            delete: () {
                              setState(() {
                                todoList.removeWhere(
                                    (element) => element.id == x.id);
                              });
                            },
                          ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                            bottom: 28,
                            right: 28,
                            left: 28,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 10.0,
                                  spreadRadius: 0.0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            controller: taskdata,
                            maxLines: null,
                            decoration: InputDecoration(
                              hintText: 'Add a new todo item',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 20,
                          right: 20,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              String id = DateTime.now()
                                  .millisecondsSinceEpoch
                                  .toString();
                              String content =
                                  taskdata.text.toString().isNotEmpty
                                      ? taskdata.text.toString()
                                      : '(unnamed task)';
                              ToDo element = ToDo(id: id, content: content);

                              founditem.add(element);
                              taskdata.clear();
                            });
                          },
                          child: Text(
                            '+',
                            style: TextStyle(
                              fontSize: 40,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            minimumSize: Size(60, 60),
                            elevation: 10,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row appbar_build() {
    return Row(
      children: const [
        Icon(
          Icons.menu,
          color: Colors.black,
          size: 30,
          weight: 50.0,
        ),
        Spacer(),
        CircleAvatar(
          child: Icon(
            Icons.verified_user,
            color: Colors.lightBlue,
            size: 20,
          ),
        ),
      ],
    );
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> result = [];
    if (enteredKeyword.isEmpty) {
      result = todoList;
    } else {
      result = todoList
          .where((element) => element.content!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      founditem=result;
    });
  }
}
