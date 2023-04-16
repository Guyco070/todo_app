import 'package:flutter/material.dart';
import 'package:todo_app/screens/done_screen.dart';
import 'package:todo_app/screens/todo_screen.dart';

class CaustomScaffold extends StatelessWidget {
  CaustomScaffold({super.key, required this.child, required this.index});
  final Widget child;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.of(context)
                      .pushReplacementNamed(TodoScreen.routeName);
                  break;
                case 1:
                  Navigator.of(context)
                      .pushReplacementNamed(DoneScreen.routeName);
                  break;
              }
            },
            currentIndex: index,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.remove_done_outlined),
                label: "לעשות",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check),
                label: "נעשו",
              ),
            ]),
        body: SafeArea(child: child));
  }
}
