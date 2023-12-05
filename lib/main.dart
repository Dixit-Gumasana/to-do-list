import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController _controller = TextEditingController();

  List items = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'To Do List',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black54),
          ),
          centerTitle: true,
          backgroundColor: Colors.cyan,
        ),
        backgroundColor: Color(0xffb5cfe8),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.black54),
                decoration: InputDecoration(
                    label: Text('Enter your task here'),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            items.add(_controller.text);
                            _controller.clear();
                          });
                        },
                        icon: Icon(Icons.add)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              fit: FlexFit.loose,
              child: ListView.builder(
                itemCount: items.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "${items[index]}",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                items.removeAt(index);
                              });
                            },
                            icon: Icon(Icons.delete),
                            iconSize: 25,
                          ),
                        ],
                      ),
                      Divider(
                        indent: 10,
                        endIndent: 10,
                        height: 2,
                        color: Color(0xff8593a1),
                      ),
                      SizedBox(height: 15),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

