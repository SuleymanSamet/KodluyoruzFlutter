import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ogrencitakip/constants/color.dart';
import 'package:ogrencitakip/constants/tasktype.dart';
import 'package:ogrencitakip/model/task.dart';
import 'package:ogrencitakip/screens/add_new_task.dart';
import 'package:ogrencitakip/todoitem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //List<String> todo = ["Study Lessons", "Run 5k", "Go to party"];
  //List<String> completed = ["Game meetup", "Take out trash"];
  List<Task> todo = [
    Task(
        type: TaskType.note,
        title: "İş",
        description: "Work",
        isComplated: false),
    Task(
        type: TaskType.calender,
        title: "Oyun",
        description: "Games",
        isComplated: false),
    Task(
        type: TaskType.contest,
        title: "Eğitim",
        description: "Student",
        isComplated: false),
  ];

  List<Task> completed = [
    Task(
        type: TaskType.calender,
        title: "Go to party",
        description: "party",
        isComplated: false),
    Task(
        type: TaskType.contest,
        title: "Alışveriş",
        description: "Shop",
        isComplated: false),
  ];

  void addNewTask(Task newTask) {
    setState(() {
      todo.add(newTask);
    });
  }

  List<String> completedd = ["GAME", "TAKE OUT TRASH"];
  @override
  Widget build(BuildContext context) {
    //TodoService todoService = TodoService();
    double deviceHeight = MediaQuery.of(context).size.width;
    double deviceWeight = MediaQuery.of(context).size.height;
    return MaterialApp(
        home: SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backgroundColor),
        body: Column(
          children: [
            Container(
              width: deviceWeight,
              height: deviceHeight / 2,
              decoration: const BoxDecoration(
                  color: Colors.amber,
                  image: DecorationImage(
                      image: AssetImage("lib/assets/images/header.jpg"),
                      fit: BoxFit.cover)),
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Octaber 20,2022",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "My Todo List",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: SingleChildScrollView(
                  child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: todo.length,
                    itemBuilder: (context, index) {
                      return TodoItem(
                        task: todo[index],
                      );
                    },
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Complated",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: SingleChildScrollView(
                  child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: completed.length,
                    itemBuilder: (context, index) {
                      return TodoItem(task: completed[index]);
                    },
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddNewTaskScreen(
                    addNewTask: (newTask) => addNewTask(newTask),
                  ),
                ));
              },
              child: const Text("Add New Task"),
            )
          ],
        ),
      ),
    ));
  }
}
