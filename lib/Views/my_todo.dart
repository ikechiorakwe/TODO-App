import 'package:flutter/material.dart';
import 'package:my_to_do/Controllers/todo_controller.dart';
import 'package:my_to_do/Models/todo_model.dart';
import 'package:provider/provider.dart';

class MyTodoScreen extends StatefulWidget {
  const MyTodoScreen({Key? key}) : super(key: key);

  @override
  State<MyTodoScreen> createState() => _MyTodoScreenState();
}

class _MyTodoScreenState extends State<MyTodoScreen> {
  @override
  Widget build(BuildContext context) {
    final MyTodoController logic = MyTodoController(context);
    return Scaffold(
      backgroundColor: Colors.blue,
      floatingActionButton: // FAB Button
          FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
              ),
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        // To do textfield
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            // border: UnderlineInputBorder(),
                            labelText: 'Enter Todo',
                          ),
                          controller: logic.controller,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        height: 50,
                        width: 120,
                        child: OutlinedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            )),
                          ),
                          onPressed: () {
                            var todo = context.read<TodoModel>();
                            todo.addTaskInList(logic.controller.text);
                            // Provider.of<TodoModel>(context, listen: false)
                            //     .addTaskInList(logic.controller.text);
                          },
                          child: Text(
                            "Add",
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
        foregroundColor: Colors.blue.shade50,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 150.0),
          // Time
          Center(
            child: Text(
              "3:45 pm",
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Colors.white,
                  fontSize: 45,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10.0),
          // Main to do list
          Flexible(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0))),
              child: Consumer<TodoModel>(builder: (context, todo, child) {
                // List view builder
                return ListView.builder(
                    itemCount: todo.taskList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(
                            bottom: 8, left: 16, right: 16),
                        child: ListTile(
                          contentPadding: const EdgeInsets.only(
                              left: 32, right: 32, top: 8, bottom: 8),
                          title: Text(
                            todo.taskList[index].title,
                            style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: const Icon(
                            Icons.check_circle,
                            color: Colors.greenAccent,
                          ),
                        ),
                      );
                    });
              }),
            ),
          )
        ],
      ),
    );
  }
}
