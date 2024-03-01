import 'package:assignment/Model/Tasksfavourite.dart';
import 'package:assignment/Model/task.dart';
import 'package:assignment/Widget/Details.dart';
import 'package:assignment/Widget/overview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // final _appRouter = AppRouter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Favoriteprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Task(
            userId: '',
            id: '',
            title: '',
            body: '',
          ),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: TaskoveviewWidget.routeName,
        theme: ThemeData(
            textTheme: const TextTheme(
                titleLarge: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
            )),
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromRGBO(175, 21, 90, 1)),
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
                centerTitle: true, color: Color.fromRGBO(216, 57, 171, 1))),
        routes: {
          TaskoveviewWidget.routeName: (context) => TaskoveviewWidget(),
          Cardtbody.routeName: (context) => const Cardtbody(
                title: '',
                body: '',
              )
        },
        home: const TaskoveviewWidget(),
      ),
    );
  }
}
