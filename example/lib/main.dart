import 'package:flutter/material.dart';
import 'package:sam_utils/sam_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Example App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Firebase Example App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textController =
      TextEditingController(text: "Hello sam_utils");

  @override
  Widget build(BuildContext context) {
    printLog('Prints log messages to the console', "ERROR");

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('App is running on a web platform : ${isAppRunningOnWeb()}'),
            Text(
                'Provided email is in a valid format : ${SamUtils().isEmailValid("abc@gmail.com")}'),
            Text(
                'Trimmed text of the provided TextEditingController : ${SamUtils().getTextEditingString(_textController)}'),
            Text(
                'TextEditingController is null or its text is empty : ${SamUtils().isTextEditingEmpty(_textController)}'),
            Text(
                'Width of the screen in pixels : ${SamUtils().getScreenWidth(context)}'),
            Text(
                'Converts the provided dynamic value to double : ${SamUtils.parseDynamicToDouble("123")}'),
            Text(
                'Name of the platform the app is running on : ${SamUtils().getPlatformName()}'),
            Text(
                'Current date and time in the format dd-MM-yyyy HH:mm:ss : ${SamUtils().getCurrentDateTime()}'),
            Text(
                'Current date in the format dd-MM-yyyy : ${SamUtils().getCurrentDate()}'),
            Text(
                'Current time in the format HH:mm:ss : ${SamUtils().getCurrentTime()}'),
            Text(
                'Current timestamp in milliseconds : ${SamUtils().getCurrentTimeStamp()}'),
            Text(
                'Number of hours in the provided number of milliseconds : ${SamUtils().millisecondToHours(19616565)}'),
          ],
        ),
      ),
    );
  }
}
