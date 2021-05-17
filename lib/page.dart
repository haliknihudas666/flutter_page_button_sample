import 'package:flutter/material.dart';

class SamplePage extends StatefulWidget {
  @override
  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: Icon(Icons.remove),
                ),
                Text(_counter.toString()),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _counter);
              },
              child: Text('Return to Main'),
            ),
          ],
        ),
      ),
    );
  }
}
