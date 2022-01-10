import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clg/controller/todoController.dart';
import 'package:todo_clg/model/todo.dart';
import 'package:todo_clg/screen/drawer.dart';
import 'package:todo_clg/screen/todoScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final TodoController todoController = Get.put(TodoController());
    return Scaffold(
      drawer: mydra(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Get.to(() => TodoScreen());
        },
      ),
      body: CustomScrollView(
          slivers: <Widget>[
            // ignore: prefer_const_constructors
            SliverAppBar(
              pinned: true,
              snap: false,
              floating: false,
              expandedHeight: 160.0,
              flexibleSpace: const FlexibleSpaceBar(
                title: Text('Amol'),
                background: FlutterLogo(),
              ),
            ),
            SliverFillRemaining(
             // fillOverscroll: false,
              child: Obx(() => ListView.separated(
                  itemBuilder: (context, index) => Dismissible(
                        key: UniqueKey(),
                        onDismissed: (_) {
                          
                          Todo? removed = todoController.todo[index];
                          todoController.todo.removeAt(index);
                          // ignore: unused_label

                          Get.snackbar('Task removed',
                              'The task "${removed.text}" was successfully removed.',
                              backgroundColor: Colors.amber,
                              mainButton: TextButton(
                                child: Text('Undo'),
                                onPressed: () {
                                  if (removed?.text == "") {
                                    return;
                                  }

                                  todoController.todo.insert(index, removed!);
                                  removed = null;
                                  if (Get.isSnackbarOpen) {
                                    Get.back();
                                  }
                                },
                              ));
                        },
                        child: ListTile(
                          title: Text(
                              todoController.todo[index].text.toString(),
                              style: (todoController.todo[index].done) ||
                                      todoController.todo[index].date!
                                          .isBefore(DateTime.now())
                                  ? TextStyle(
                                      color: Colors.red,
                                      decoration: TextDecoration.lineThrough)
                                  : TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.color)),
                          subtitle: Text(
                              todoController.todo[index].date.toString(),
                              style: (todoController.todo[index].done) ||
                                      todoController.todo[index].date!
                                          .isBefore(DateTime.now())
                                  //||todoController.todo[index].date!=null??(todoController.todo[index].date!.toUtc().isBefore(DateTime.now().toUtc()))
                                  ? TextStyle(
                                      // color: Colors.red,
                                      decoration: TextDecoration.lineThrough)
                                  : TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.color)),
                          onTap: () {
                            Get.to(TodoScreen(
                              index: index,
                            ));
                          },
                          leading: Checkbox(
                            value: todoController.todo[index].done,
                            onChanged: (Value) {
                              print(todoController.todo[index].date!
                                  .isBefore(DateTime.now()));
                              //  ee= todoController.todo.length;
                              // DateTime? todoTime =
                              //     todoController.todo[index].date;
                              // DateTime? nowTime = DateTime.now();
                              // bool dff = todoTime!.isAfter(nowTime);
                              // dff == true ? print("hello" ):print( "hiii");
                              var changed = todoController.todo[index];
                              changed.done = Value!;
                              todoController.todo[index] = changed;
                            },
                          ),
                          trailing: Icon(Icons.chevron_right),
                        ),
                        background: Container(
                          color: Colors.red,
                           child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                        ),
                      ),
                  separatorBuilder: (_, __) => Divider(),
                  itemCount: todoController.todo.length)),

            )
          ],
        )
    );
  }
}
