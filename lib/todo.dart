import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/main.dart';
import 'package:intl/intl.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _taskController = TextEditingController();

   List items = [];
   List time = [];
  List time1 = [];



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var time = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'To Do List',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.lightBlue.shade200,
      body: Container(
        margin: EdgeInsets.all(12),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black54, width: 2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty || value == " ") {
                      return "Please enter task";
                    }
                    return null;
                  },
                  controller: _taskController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.black)),
                      label: Text('Enter your task here',
                          style: TextStyle(color: Colors.black)),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (_formKey.currentState!.validate()) {
                                items.add(_taskController.text);
                                // sharedPreferences?.setString(
                                //     "items", _taskController.text);
                                _taskController.clear();
                                FocusScope.of(context).unfocus();
                                Fluttertoast.showToast(
                                    msg: "Task Added Successfully!",
                                    backgroundColor: Colors.blue,
                                    textColor: Colors.black54);
                                 time.add(DateFormat("yMMMMd").format(DateTime.now()));
                                time1.add(DateFormat("Hm").format(DateTime.now()));

                                // debugPrint("---$time");
                              }
                            });
                          },
                          icon: Icon(Icons.add)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                ),
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
                              "${index + 1}. ${items[index]}",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                items.removeAt(index);
                                Fluttertoast.showToast(
                                    msg: "Task Deleted!",
                                    backgroundColor: Colors.blue,
                                    textColor: Colors.black54);
                              });
                            },
                            icon: Icon(Icons.delete),
                            iconSize: 20,
                          ),
                        ],
                      ),
                      // SizedBox(height: 1),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text("Created at : ${time1[index]} on ${time[index]}",
                            style: TextStyle(
                              fontSize: 12
                            )),
                          )),
                      Divider(
                        indent: 10,
                        endIndent: 10,
                        height: 2,
                        color: Colors.black54,
                      ),
                      SizedBox(height: 20),
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
