import 'package:flutter/material.dart';
import 'package:flutter_page_button_sample/page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> buttons = [];
  List<int> numbers = [];

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            ...buttons,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addButton,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  addButton() {
    setState(() {
      numbers.add(0);
      buttons.add(newButton(_count));
      _count++;
    });
  }

  Widget newButton(int count) {
    var title = 'Pick Number';
    return ListTile(
      tileColor: Colors.lightBlueAccent,
      onTap: () async {
        //Get value from another page and return here
        var value = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SamplePage(),
          ),
        );

        setState(() {
          numbers.insert(count, value);
          //This should update the title text
          title = getTitle(count);
        });

        print('Value: $value');
      },
      //Number should show as title if the value is not equal to 0
      title: Text(
        title,
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.cancel,
          color: Colors.black,
        ),
        onPressed: () {
          print(count);
          //Remove the tile
          //And the problem here is when we remove the tiles except the last tile
          setState(() {
            _count--;
            buttons.removeAt(count);
            numbers.removeAt(count);
          });
        },
      ),
    );
  }

  String getTitle(int count) {
    print('update');
    if (numbers[count] != 0) {
      print('get ${numbers[count]}');
      return numbers[count].toString();
    } else {
      print('get pick');
      return 'Pick Number';
    }
  }
}
