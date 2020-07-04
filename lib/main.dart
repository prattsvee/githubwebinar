import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String name = "PRATIK VEERA";
  String newname;
  final _namecontroller = TextEditingController();
  bool fav = true;
  int count = 41;
  int totalcount = 0;

  @override
  void dispose() {
    _namecontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    Container topSectionColumn() {
      return Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("$name",
                style: TextStyle(
                    color: fav ? Colors.green : Colors.black,
                    fontWeight: FontWeight.bold)),
            Padding(padding: EdgeInsets.all(2.0)),
            Text("Mumbai Sakec"),
          ],
        ),
      );
    }

    void favunfav() {
      setState(() {
        fav = !fav;
        if (fav == true) {
          count = count + 1;
          totalcount = totalcount + 1;
          // Scaffold.of(context)
          //     .showSnackBar(SnackBar(content: Text('$totalcount')));
        } else {
          count = count - 1;
          totalcount = totalcount + 1;
          // Scaffold.of(context)
          //     .showSnackBar(SnackBar(content: Text('$totalcount')));
        }

        // Scaffold(body: SnackBar(content: Text('$totalcount')));
      });
    }

    // void namechanger()

    // }


    Container topSection() {
      return Container(
        padding: EdgeInsets.all(30),
        child: Row(
          children: <Widget>[
            Expanded(child: topSectionColumn()),
            Builder(builder: (BuildContext context) {
              return IconButton(
                icon: (fav ? Icon(Icons.star) : Icon(Icons.star_border)),
                onPressed: () {
                  favunfav();
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('$totalcount'),duration: Duration(seconds: 1),));
                },
                color: Colors.deepOrange,
              );
            }),
            Text("$count"),
          ],
        ),
      );
    }

    Column buttonSectionColumn(
        {Color color, IconData icondata, String label, Function urlpath}) {
      return Column(
        children: <Widget>[
          IconButton(
            icon: Icon(icondata, color: color),
            onPressed: urlpath,
          ),
          Text(label),
        ],
      );
    }

    Widget buttonsection() {

      return Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buttonSectionColumn(
              color: color,
              icondata: Icons.call,
              label: "CALL",
              // urlpath:(){_launchURL();}
            ),
            buttonSectionColumn(
                color: color, icondata: Icons.chat, label: "CHAT"),
            buttonSectionColumn(
                color: color, icondata: Icons.share, label: "SHARE"),
          ],
        ),
      );
    }

    Widget textsection() {
      return Container(
        padding: const EdgeInsets.all(32),
        color: Colors.blue,
        child: Text(
          'Mussoorie is a hill station and a municipal board in the Dehradun District of the Indian state of Uttarakhand. It is about 35 kilometres (22 mi) from the state capital of Dehradun and 290 km (180 mi) north of the national capital of New Delhi. The hill station is in the foothills of the Garhwal Himalayan range. The adjoining town of Landour, which includes a military cantonment, is considered part of greater Mussoorie, as are the townships of Barlowganj and Jharipani. The pin code for Mussoorie is 248179',
          softWrap: true,
        ),
      );
    }

    return MaterialApp(
        title: "my own app",
        home: Scaffold(
          appBar: AppBar(
            title: Text("My Project"),
            backgroundColor: Colors.orangeAccent,
          ),

          body: ListView(children: [
            Image.asset(
              'images/tush.jpg',
              width: 600,
              height: 400,
            ),
            topSection(),
            textsection(),
            buttonsection(),
            // nameChanvtyvhbgvrtcvhbvtrtvge(),
          ],
          ),
        ));
  }

  canLaunch(String url) {}
}
