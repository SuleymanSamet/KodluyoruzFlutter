import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScaffoldMessenger(
        child: Scaffold(
          appBar: AppBar(
            title: Text('UI App with Flutter'),
            backgroundColor: Colors.green,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {},
              ),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('Menu'),
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                ),
                ListTile(
                  title: Text('Item 1'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Item 2'),
                  onTap: () {},
                ),
              ],
            ),
          ),
          body: Builder(
            builder: (BuildContext context) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Benim Uygulamama Hoşgeldiniz',
                      style: TextStyle(fontSize: 24),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.orange,
                          child: Text('Widget 1'),
                        ),
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.orange,
                          child: Text('Widget 2'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            final snackBar = SnackBar(
                                content: Text(
                                    'Kapatmak için Close Text Button basın',
                                    style: TextStyle(color: Colors.green)),
                                duration: Duration(hours: 1));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          child: Text('OPEN Text Button'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                          child: Text('CLOSE Text Button'),
                        ),
                      ],
                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Bu benim ilk mobil uygulama deneyim'),
                    ),
                    FloatingActionButton.extended(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  title: Text('Bu Bir Diyalog Kutusudur'),
                                  content:
                                      Text('Altında bir kapatma tuşu bulunur.'),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // Diyalog kutusunu kapat
                                        },
                                        child: Text(
                                            'Kapat')) // Düğmenin metnini ayarla
                                  ]);
                            });
                      },
                      label: Icon(Icons.add), // Düğmenin ikonunu ayarla
                      backgroundColor:
                          Colors.green, // Düğmenin arka plan rengini ayarla
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
