import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog & Modal Sheet'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () => showModal(context), child: Text('Hello World')),
      ),
    );
  }

  /* 
  builder: (_) => AlertDialog(
              title: Text('Hello World'),
              content: Text('My Dialog Text My Dialog Text'),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: Text('Cancel')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Text('OK'))
              ],
            )
  */
  showMyDialog(BuildContext context) async {
    var isConfirmed = await showDialog<bool>(
        barrierDismissible: false,
        context: context,
        builder: (_) => AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: Container(
                color: Colors.red,
                child: ElevatedButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text('Close Me')),
              ),
            ));
    if (isConfirmed ?? false) {
      print('User Confirmed the dialog');
    }
  }

  showModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => Wrap(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  leading: Icon(Icons.check),
                  title: Text('Agree'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  leading: Icon(Icons.close),
                  title: Text('Cancel'),
                )
              ],
            ));
  }
}
