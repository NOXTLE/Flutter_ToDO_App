import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyWidget extends StatelessWidget {
  final String taskName;
  final bool isChecked;
  final Function(bool?)? onTap;
  final Function(BuildContext)? remove;

  const MyWidget(
      {required this.taskName,
      required this.isChecked,
      required this.onTap,
      required this.remove,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: remove,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(20),
            backgroundColor: Colors.redAccent,
          )
        ]),
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
                height: MediaQuery.of(context).size.height / 7,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Checkbox(
                            activeColor: Colors.deepPurple,
                            value: isChecked,
                            onChanged: onTap),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          taskName,
                          style: TextStyle(
                              fontSize: 16,
                              decoration: isChecked
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none),
                        ),
                      ),
                    ],
                  ),
                ))),
      ),
    );
  }
}
