import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tasktile.dart';

List TaskItems = [];
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: myWidget(),
    ),
  );
}

class myWidget extends StatefulWidget {
  const myWidget({super.key});
  @override
  State<myWidget> createState() {
    return _myWidgetState();
  }
}

class _myWidgetState extends State<myWidget> {
  @override
  Widget build(context) {
    final myController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text('To-Do App',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.white))),
      body: Main(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.yellow.shade300,
                    content: Container(
                      height: 250,
                      width: 500,
                      decoration: BoxDecoration(
                          color: Colors.yellow.shade300,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          const Text('Add Task'),
                          const SizedBox(
                            height: 40,
                          ),
                          TextField(
                            controller: myController,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.greenAccent),
                                ),
                                onPressed: () {
                                  setState(() {
                                    TaskItems.add([myController.text, false]);
                                  });

                                  Navigator.pop(context);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.check),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.redAccent)),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.cancel),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          child: const Icon(Icons.add)),
    );
  }
}

class Main extends StatefulWidget {
  const Main({
    super.key,
  });

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    void deleteTask(int index) {
      setState(() {
        TaskItems.removeAt(index);
      });
    }

    void checked(bool? value, int index) {
      setState(() {
        TaskItems[index][1] = !TaskItems[index][1];
      });
    }

    return Container(
        decoration: BoxDecoration(color: Colors.yellow.shade200),
        child: ListView.builder(
          itemCount: TaskItems.length,
          itemBuilder: (context, index) {
            return MyWidget(
                taskName: TaskItems[index][0],
                isChecked: TaskItems[index][1],
                remove: (context) => deleteTask(index),
                onTap: (value) => checked(value, index));
          },
        ));
  }
}
