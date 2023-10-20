import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var sehirListesi = ['İstanbul', 'Ankara', 'İzmir', 'Bursa', 'Adana'];

  // Declare havaDurumu as a class member variable
  var havaDurumu;

  @override
  void initState() {
    super.initState();
    _havaDurumuAl();
  }

  void _havaDurumuAl() async {
    // Remove the var keyword from havaDurumu declaration
    havaDurumu = {};
    for (final sehir in sehirListesi) {
      final response = await http.get(
        Uri.parse(
            'https://weatherapi-com.p.rapidapi.com/current.json?q=$sehir'),
        headers: {
          'X-RapidAPI-Key':
              '8530a8fcd6msha29680d423bf76ep1bcd6ejsn746b2a226fbb',
          'X-RapidAPI-Host': 'weatherapi-com.p.rapidapi.com',
        },
      );
      final responseData = jsonDecode(response.body);
      havaDurumu[sehir] = responseData;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Hava Durumu'),
      ),
      body: Center(
        child: havaDurumu != null
            ? ListView.builder(
                itemCount: sehirListesi.length,
                itemBuilder: (context, index) {
                  final sehir = sehirListesi[index];
                  // Rename the local variable to havaDurumuData
                  final havaDurumuData = havaDurumu[sehir];
                  return Card(
                    child: ListTile(
                      title: Text(sehir),
                      subtitle: Text(
                          '${havaDurumuData['current']['temp_c']} °C, ${havaDurumuData['current']['condition']['text']}'),
                    ),
                  );
                },
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
