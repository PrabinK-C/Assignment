import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Task with ChangeNotifier {
  final String userId;
  final String id;
  final String title;
  final String body;
  Task({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  Future<List<Task>> fetchposts() async {
    final url = Uri.https('jsonplaceholder.typicode.com', '/posts');

    try {
      final response = await http.get(
        url,
      );
      List<dynamic> jsondata = jsonDecode(response.body);
      List<Task> tasks = jsondata.map<Task>((jsond) {
        return Task(
          userId: jsond['userId'].toString(),
          id: jsond['id'].toString(),
          title: jsond['title'],
          body: jsond['body'],
        );
      }).toList();
      return tasks;
    } catch (e) {
      if (kDebugMode) {
        print('Error:$e');
      }
      return [];
    }
  }
}
