import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/widgets/add_widget.dart';
import 'package:todo_app/widgets/bottom_bar.dart';
import 'package:todo_app/widgets/caustom_scaffold.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});
  static const routeName = "/done_screen";

  @override
  Widget build(BuildContext context) {
    final TodoProvider todoProvider = Provider.of<TodoProvider>(context);

    return CaustomScaffold(
        index: 1,
        child: Column(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height  -
                    84,
                child: ListView.builder(
                    itemCount: todoProvider.tasks.length,
                    itemBuilder: (context, index) {
                      if (todoProvider.tasks[index].isDone) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            textDirection: TextDirection.rtl,
                            children: [
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      IconButton(
                                    icon: const Icon(Icons.check),
                                    onPressed: () => todoProvider.updateIsDone(todoProvider.tasks[index])
                                    ,
                                  ),
                                  Text(todoProvider.tasks[index].toDo),
                                ],
                              ),
                              IconButton(onPressed: () => todoProvider.removeTask(todoProvider.tasks[index])
                              , icon: const Icon(Icons.remove)),
                            ],
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
              ),
            ),
            // const BottomBar()
          ],
        )
    );
  }
}
