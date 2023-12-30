import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _taskController = TextEditingController();

  List items = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'To Do List',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.purpleAccent.withOpacity(0.4),
      body: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.black54,
                width: 2
            )
        ),
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
                          borderSide: BorderSide(
                              color: Colors.black
                          )
                      ),
                      label: Text('Enter your task here',style: TextStyle(
                          color: Colors.black
                      )),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (_formKey.currentState!.validate()) {
                                items.add(_taskController.text);
                                _taskController.clear();
                                Fluttertoast.showToast(
                                    msg: "Task Added Successfully!",
                                    backgroundColor: Color(0xff36D1DC),
                                    textColor: Colors.black45);
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
                              "~ ${items[index]}",
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
                                Fluttertoast.showToast(
                                    msg: "Task Deleted!",
                                    backgroundColor: Color(0xff36D1DC),
                                    textColor: Colors.red);
                              });
                            },
                            icon: Icon(Icons.delete),
                            iconSize: 20,
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
