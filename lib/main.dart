import 'dart:math';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather app ',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Weather Info App '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
List<int> temperatures = [];
List<String> conditions = [];
 final random = Random();
 String cityName = ""; 
 String condition = ""; 
 int Temperature= 0; 

late TextEditingController _controller;



 List<int> generateRandomTemperatures(){

     int randomTemp = 15 + random.nextInt(30 - 15 + 1);
   return List.generate(5, (index) => randomTemp);
   }

   List<String> generateRandomConditions() { 
    
    List<String> conditions = ['Sunny', 'Cloudy', 'Rainy'];
    return List.generate(5, (index) => conditions[random.nextInt(conditions.length)]);
  } 
  
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }


void updateForecast() {
    setState(() {
      temperatures = generateRandomTemperatures();
      conditions = generateRandomConditions();
      cityName = _controller.text ;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      // ignore: prefer_const_constructors
      body: Center(
        
        
          // ignore: prefer_const_constructors
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[

              TextField(
                controller: _controller,
                obscureText: true,        
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'City Name',)
                ),

              const SizedBox(height: 40),
              
                // ElevatedButton(onPressed: _fetchWeather , child: Text("Feact weather")),
                ElevatedButton(onPressed: updateForecast , child: Text("7-day weather forecast")),

                
            Text(
              'City Name: $cityName' ,
            ),

                Expanded(child: ListView.builder(
              itemCount: temperatures.length,
              itemBuilder: (context, index) {
                // Set appropriate icon based on the weather condition
                
                return ListTile(
                  title: Text('Day ${index + 1}: ${conditions[index]}'),
                  trailing: Text('${temperatures[index]}°C'),
                );
              },
            )   ),
                     

                  
            ],
          ),
      ),
     
    );
  }
}
