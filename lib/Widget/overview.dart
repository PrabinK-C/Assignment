import 'package:assignment/Model/Tasksfavourite.dart';
import 'package:assignment/Model/task.dart';
import 'package:assignment/screens/TaskOverview.dart';
import 'package:assignment/screens/favorittaskView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum Filteroptions {
  favourites,
  all,
}

class TaskoveviewWidget extends StatefulWidget {
  const TaskoveviewWidget({super.key});
  static const routeName = '/taskoverview';

  @override
  State<TaskoveviewWidget> createState() => _TaskoveviewWidgetState();
}

class _TaskoveviewWidgetState extends State<TaskoveviewWidget> {
  var _showonlyFavorites = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var tasksProvider = Provider.of<Task>(context, listen: false);
      var favoriteProvider =
          Provider.of<Favoriteprovider>(context, listen: false);
      List<Task> tasks = await tasksProvider.fetchposts();
      favoriteProvider.setAllTasks(tasks);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Assignment"),
        actions: [
          PopupMenuButton(
            onSelected: (Filteroptions selectedvalue) {
              setState(() {
                if (selectedvalue == Filteroptions.favourites) {
                  _showonlyFavorites = true;
                } else {
                  _showonlyFavorites = false;
                }
              });
            },
            icon: const Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: Filteroptions.all,
                child: Text("Show All"),
              ),
              const PopupMenuItem(
                value: Filteroptions.favourites,
                child: Text("Only Favouitres"),
              ),
            ],
          ),
        ],
      ),
      body:
          _showonlyFavorites ? const FavoriteTasksView() : const TaskOverview(),
    );
  }
}
