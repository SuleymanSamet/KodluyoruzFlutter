import 'package:flutter/material.dart';

class Task {
  String name;
  String description;
  String startDate;
  String endDate;

  Task({
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
  });
}

class TaskList with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('To-Do Listesi'),
        ),
        body: TaskListView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Yeni görev ekleme işlemi burada yapılabilir.
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class TaskListView extends StatefulWidget {
  @override
  _TaskListViewState createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  final TaskList taskList = TaskList();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Yeni görevler ekleyin
    taskList.addTask(Task(
        name: 'Görev 1',
        description: 'Açıklama 1',
        startDate: '14-10-2023',
        endDate: '15-10-2023'));
    taskList.addTask(Task(
        name: 'Görev 2',
        description: 'Açıklama 2',
        startDate: '16-10-2023',
        endDate: '17-10-2023'));
    taskList.addTask(Task(
        name: 'Görev 3',
        description: 'Açıklama 3',
        startDate: '18-10-2023',
        endDate: '19-10-2023'));
    taskList.addTask(Task(
        name: 'Görev 4',
        description: 'Açıklama 4',
        startDate: '20-10-2023',
        endDate: '21-10-2023'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: taskList.tasks.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(taskList.tasks[index].name),
            onDismissed: (direction) {
              setState(() {
                taskList.removeTask(taskList.tasks[index]);
              });
            },
            background: Container(color: Colors.red),
            child: ListTile(
              title: Text(taskList.tasks[index].name),
              subtitle: Text(
                '${taskList.tasks[index].description}\n'
                'Başlangıç Tarihi: ${taskList.tasks[index].startDate}\n'
                'Bitiş Tarihi: ${taskList.tasks[index].endDate}',
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Yeni Görev Ekle'),
                content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(labelText: 'Görev Adı'),
                        validator: (required) {
                          if (required!.isEmpty) {
                            return 'Lütfen bir görev adı girin';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _descriptionController,
                        decoration: InputDecoration(labelText: 'Açıklama'),
                        validator: (required) {
                          if (required!.isEmpty) {
                            return 'Lütfen bir açıklama girin';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _startDateController,
                        decoration:
                            InputDecoration(labelText: 'Başlangıç Tarihi'),
                        validator: (required) {
                          if (required!.isEmpty) {
                            return 'Lütfen bir başlangıç tarihi girin';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _endDateController,
                        decoration: InputDecoration(labelText: 'Bitiş Tarihi'),
                        validator: (required) {
                          if (required!.isEmpty) {
                            return 'Lütfen bir bitiş tarihi girin';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  ElevatedButton(
                    child: Text('İptal'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ElevatedButton(
                    child: Text('Kaydet'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          taskList.addTask(Task(
                              name: _nameController.text,
                              description: _descriptionController.text,
                              startDate: _startDateController.text,
                              endDate: _endDateController.text));
                        });
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
