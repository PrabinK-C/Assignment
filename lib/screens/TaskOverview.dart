// ignore_for_file: file_names

import 'package:assignment/Model/Tasksfavourite.dart';
import 'package:assignment/Model/task.dart';
import 'package:assignment/Widget/Details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskOverview extends StatefulWidget {
  const TaskOverview({super.key});

  @override
  State<TaskOverview> createState() => _TaskOverviewState();
}

class _TaskOverviewState extends State<TaskOverview> {
  late Future<List<Task>> _futureTasks;
  @override
  void initState() {
    super.initState();
    _futureTasks = Provider.of<Task>(context, listen: false).fetchposts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(47, 246, 156, 243),
      margin: const EdgeInsets.all(10),
      child: FutureBuilder<List<Task>>(
        future: _futureTasks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Task task = snapshot.data![index];

                return Consumer<Favoriteprovider>(
                    builder: (context, favourite, child) {
                  var isFav = favourite.isFavoriteById(task.id);
                  return Card(
                    color: Theme.of(context).cardColor,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Cardtbody(title: task.title, body: task.body),
                            ));
                      },
                      child: ListTile(
                        title: Text(task.title,
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 20,
                              overflow: TextOverflow.clip,
                            )),
                        trailing: IconButton(
                          onPressed: () {
                            if (isFav) {
                              favourite.removeFavoriteById(task.id);
                            } else {
                              favourite.addFavoriteById(task.id);
                            }
                          },
                          icon: Icon(isFav ? Icons.star : Icons.star_border),
                        ),
                      ),
                    ),
                  );
                });
              },
            );
          } else {
            return const Center(child: Text('No data found'));
          }
        },
      ),
    );
  }
}
