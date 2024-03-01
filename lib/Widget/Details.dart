// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Cardtbody extends StatelessWidget {
  final String title;
  final String body;
  // final VoidCallback onpressed;
  const Cardtbody({
    required this.title,
    required this.body,
    super.key,
    // required this.onpressed,
  });
  static const routeName = 'Details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromRGBO(216, 57, 171, 1).withOpacity(.2),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Align(
            alignment: Alignment.topCenter,
            child: Card(
              color: const Color.fromARGB(255, 83, 178, 219),
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 80,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(body,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
