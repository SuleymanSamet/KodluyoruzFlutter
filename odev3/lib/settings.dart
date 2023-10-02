import 'package:flutter/material.dart';

void main() {
  runApp(SettingsApp());
}

class SettingsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isThemeSwitched = false;
  bool isNotificationSwitched = false;
  String dropdownValue = 'Daily';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Geri düğmesine basıldığında ne olacağını burada belirleyebilirsiniz.
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Theme Settings'),
            trailing: Switch(
              value: isThemeSwitched,
              onChanged: (value) {
                setState(() {
                  isThemeSwitched = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text('Notification Settings'),
            trailing: Switch(
              value: isNotificationSwitched,
              onChanged: (value) {
                setState(() {
                  isNotificationSwitched = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text('Enable Notifications'),
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
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
