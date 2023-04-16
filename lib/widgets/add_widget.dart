import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/todo_provider.dart';

class AddWidget extends StatelessWidget {
  const AddWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: TextField(
          textDirection: TextDirection.rtl,
          controller: controller,
          decoration: InputDecoration(
              prefixIcon: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  Provider.of<TodoProvider>(context, listen: false).addTask(controller.text);
                },
              ),
              hintText: 'הוסף משימה',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.primary))),
          onChanged: (val) {
            
          },
        ),
      ),
    );
  }
}
