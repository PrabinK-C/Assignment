// ignore_for_file: file_names

import 'package:assignment/Model/Tasksfavourite.dart';
import 'package:assignment/Widget/Details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteTasksView extends StatelessWidget {
  const FavoriteTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<Favoriteprovider>(context);
    final favoriteTasks = favoriteProvider.favoriteTasks;
    return Scaffold(
      body: ListView.builder(
          itemCount: favoriteTasks.length,
          itemBuilder: (ctx, i) {
            if (i < favoriteTasks.length) {
              final task = favoriteTasks[i];
              final isFav = favoriteProvider.isFavoriteById(task.id);
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Cardtbody(title: task.title, body: task.body),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                      20,
                    )),
                    child: ListTile(
                      title: Text(
                        task.title,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          if (isFav) {
                            favoriteProvider.removeFavoriteById(task.id);
                          } else {
                            favoriteProvider.addFavoriteById(task.id);
                          }
                        },
                        icon: Icon(isFav ? Icons.star : Icons.star_border),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return const Text("Item not available");
            }
          }),
    );
  }
}
