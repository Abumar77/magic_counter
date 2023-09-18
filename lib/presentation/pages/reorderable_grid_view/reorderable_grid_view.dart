import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

@RoutePage()
class ReorderableCustomGridViewScreen extends StatefulWidget {
  @override
  State<ReorderableCustomGridViewScreen> createState() =>
      _ReorderableCustomGridViewScreenState();
}

class _ReorderableCustomGridViewScreenState
    extends State<ReorderableCustomGridViewScreen> {
  final data = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    Widget buildItem(String text) {
      return Card(
        key: ValueKey(text),
        child: Text(text),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Reorderable Grid View"),
      ),
      body: Center(
        // use ReorderableGridView.count() when version >= 2.0.0
        // else use ReorderableGridView()
        child: ReorderableGridView.count(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          children: this.data.map((e) => buildItem("$e")).toList(),
          onReorder: (oldIndex, newIndex) {
            setState(() {
              final element = data.removeAt(oldIndex);
              data.insert(newIndex, element);
            });
          },
          footer: [
            Card(
              child: Center(
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
