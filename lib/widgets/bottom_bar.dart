import 'package:flutter/material.dart';
import 'package:todo_app/screens/done_screen.dart';
import 'package:todo_app/screens/todo_screen.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        textDirection: TextDirection.rtl,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(TodoScreen.routeName);
              },
              child: const Text('לעשות')),
          ElevatedButton(onPressed: () {
            Navigator.of(context).pushReplacementNamed(DoneScreen.routeName);
          }, child: const Text('נעשו')),
        ],
      ),
    );
  }
}
