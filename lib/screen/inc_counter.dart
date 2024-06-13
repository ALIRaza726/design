import 'package:meditate/screen/app_bar.dart';
import 'package:flutter/material.dart';

class counterInc extends StatefulWidget {
  const counterInc({super.key});

  @override
  State<counterInc> createState() => _counterState();
}

class _counterState extends State<counterInc> {
  int incC = 0;
  void incrementCounter() {
    setState(() {
      incC++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 29, 202, 245),
          leading: Icon(Icons.person),
          title: Text('ALI'),
          actions: [
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AppBarSc()));
                },
                child: Icon(Icons.add_home_work_outlined))
          ],
        ),
        body: Center(
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('You have Pressed Button Times:'),
                Text(
                  '$incC',
                  style: Theme.of(context).textTheme.displayMedium,
                )
              ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: incrementCounter,
          tooltip: 'increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
