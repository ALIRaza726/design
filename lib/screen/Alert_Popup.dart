import 'dart:async';
import 'package:flutter/material.dart';

class alert extends StatefulWidget {
  static const routeName = '/scrolSc';

  const alert({Key? key}) : super(key: key);

  @override
  State<alert> createState() => _ScrolScState();
}

class _ScrolScState extends State<alert> {
  bool isChecked = false;
  Future popupDialog() {
    return showDialog(
      barrierColor: Colors.black54,
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Log Out'),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.cancel),
              )
            ],
          ),
          content: const Column(
            children: [
              Text('Are you sure you want to log out'),
              Text('Are you sure you want to log out'),
              Text('Are you sure you want to log out'),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(actions: [
          IconButton(
              onPressed: () {
                popupDialog();
              },
              icon: const Icon(Icons.add))
        ]),
        //   body: PopupMenuButton(
        //     onSelected: (String result) {
        //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //         content: Text('You Have Selected: $result'),
        //       ));
        //     },
        //     itemBuilder: (context) => <PopupMenuEntry<String>>[
        //       const PopupMenuItem(
        //         value: '1st Menu',
        //         child: Text('Menu num 1'),
        //       ),
        //       const PopupMenuItem(
        //         value: '2nd Menu',
        //         child: Text('Menu num 2'),
        //       ),
        //       const PopupMenuItem(
        //         value: '3rd Menu',
        //         child: Text('Menu num 3'),
        //       ),
        //     ],
        //   ),
      ),
    );
  }
}
