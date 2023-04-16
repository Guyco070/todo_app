import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/widgets/add_widget.dart';
import 'package:todo_app/widgets/caustom_scaffold.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  static const String routeName = "/";

  @override
  Widget build(BuildContext context) {
    final TodoProvider todoProvider = Provider.of<TodoProvider>(context);

    return CaustomScaffold(
        index: 0,
        child: Column(
          children: [
            const AddWidget(),
            SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height -
                    (MediaQuery.of(context).size.height * 0.1) -
                    100,
                child: ListView.builder(
                    itemCount: todoProvider.tasks.length,
                    itemBuilder: (context, index) {
                      if (!todoProvider.tasks[index].isDone) {
                        return Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.radio_button_off),
                              onPressed: () {
                                todoProvider
                                    .updateIsDone(todoProvider.tasks[index]);
                              },
                            ),
                            Text(todoProvider.tasks[index].toDo),
                          ],
                        );
                      } else {
                        return Container();
                      }
                    }),
              ),
            ),
            // const BottomBar()
          ],
        ),
      );
  }
}
