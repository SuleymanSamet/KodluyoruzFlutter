import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(ScheduleApp());
}

class ScheduleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Schedule App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SchedulePage(),
    );
  }
}

class SchedulePage extends StatelessWidget {
  final daysOfWeek = [
    'Pazartesi',
    'Salı',
    'Çarşamba',
    'Perşembe',
    'Cuma',
    'Cumartesi',
    'Pazar'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.brown,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Welcome to the Schedule App',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Image.network('https://picsum.photos/seed/picsum/600/300'),
          Container(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'See your schedule for the week:',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: daysOfWeek.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.calendar_today),
                  title: Text(daysOfWeek[index]),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              TasksPage(dayOfWeek: daysOfWeek[index])),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  bool isNotificationEnabled = false;
  String dropdownValue = 'Daily';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Settings')),
        body: ListView(children: <Widget>[
          SwitchListTile(
              title: Text('Dark Mode'),
              value: isDarkMode,
              onChanged: (bool value) {
                setState(() {
                  isDarkMode = value;
                });
              }),
          SwitchListTile(
              title: Text('Enable Notifications'),
              value: isNotificationEnabled,
              onChanged: (bool value) {
                setState(() {
                  isNotificationEnabled = value;
                });
              }),
          ListTile(
              title: Text('Notification Frequency'),
              trailing: DropdownButton<String>(
                  value: dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Daily', 'Weekly', 'Monthly']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList())),
        ]));
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Profile')),
        body: ListView(padding: const EdgeInsets.all(16.0), children: <Widget>[
          TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name')),
          TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email')),
          TextField(
              controller: locationController,
              decoration: InputDecoration(labelText: 'Location')),
          ElevatedButton(
              onPressed: () {
                final snackBar = SnackBar(
                    content: Text(
                        'Saved! Name: ${nameController.text}, Email: ${emailController.text}, Location: ${locationController.text}'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Text('Save')),
        ]));
  }
}

class TasksPage extends StatelessWidget {
  final String dayOfWeek;
  final tasks = ['Task 1', 'Task 2', 'Task 3'];

  TasksPage({required this.dayOfWeek});

  @override
  Widget build(BuildContext context) {
    var rng = new Random();
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks for $dayOfWeek'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[rng.nextInt(tasks.length)]),
          );
        },
      ),
    );
  }
}
