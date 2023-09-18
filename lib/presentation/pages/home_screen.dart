import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:magic_counter/utils/app_router.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Instruments of Developer"),
        ),
        body: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.cloud),
              title: Text("Weather_Counter APP"),
              onTap: () => context.pushRoute(const CounterRoute()),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("Reorderable List View"),
              onTap: () => context.pushRoute(const ReorderableViewRoute()),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
            ListTile(
              leading: Icon(Icons.pages_rounded),
              title: Text("Reorderable Grid View"),
              onTap: () =>
                  context.pushRoute(const ReorderableCustomGridViewRoute()),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
          ],
        ));
  }
}
