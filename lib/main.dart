import 'package:flutter/material.dart';
import 'package:newprojectfluttertesttobedeleted/my_counter.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ResetCounterProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Robot Part Counter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'ROBOT PART COUNTER v0.00001',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// VARIABLES
class _MyHomePageState extends State<MyHomePage> {
  int _hCounter = 0;
  int _aCounter = 0;
  int _lCounter = 0;
  int _robotsAssembled = 0;

//region METHODS
  void _updateHCounter(int newValue) {
    setState(() {
      _hCounter = newValue;
    });
  }

  void _updateACounter(int newValue) {
    setState(() {
      _aCounter = newValue;
    });
  }

  void _updateLCounter(int newValue) {
    setState(() {
      _lCounter = newValue;
    });
  }

  // Methods for "ASSEMBLE"
  void _assembleRobot() {
    setState(() {
      _resetCounters();
      _robotsAssembled++;
    });
  }

  void _resetAll() {
    setState(() {
      _resetCounters();
      _resetRobots();
    });
  }

  void _resetCounters() {
    setState(() {
      _hCounter = 0;
      _aCounter = 0;
      _lCounter = 0;
    });
    context.read<ResetCounterProvider>().triggerReset();
  }

  void _resetRobots() {
    setState(() {
      _robotsAssembled = 0;
    });
  }

  //endregion
// USER INTERFACE
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MyCounter(
                mainButtonIcon: Icons.face_5,
                mainButtonText: 'HEAD',
                desiredValue: 2,
                onMainButtonPressed: _updateHCounter,
                onSubtractButtonPressed: _updateHCounter,
              ),
              MyCounter(
                mainButtonIcon: Icons.pan_tool,
                mainButtonText: 'ARM',
                desiredValue: 5,
                onMainButtonPressed: _updateACounter,
                onSubtractButtonPressed: _updateACounter,
              ),
              MyCounter(
                mainButtonIcon: Icons.ice_skating_rounded,
                mainButtonText: 'LEG',
                desiredValue: 3,
                onMainButtonPressed: _updateLCounter,
                onSubtractButtonPressed: _updateLCounter,
              ),
              // "ASSEMBLE" Button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
                ),
                label: const Text(
                  'ASSEMBLE',
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 4,
                    fontWeight: FontWeight.w800,
                    fontSize: 36,
                  ),
                ),
                icon: const Icon(
                  Icons.forward,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: _hCounter == 2 && _aCounter == 5 && _lCounter == 3
                    ? _assembleRobot
                    : null,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'ROBOTS ASSEMBLED:',
                  style: TextStyle(
                    color: Colors.black54,
                    letterSpacing: 4,
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
              ),
              // "TOTAL ROBOTS ASSEMBLED"
              Text(
                '$_robotsAssembled',
                style: const TextStyle(
                  color: Colors.black54,
                  letterSpacing: 4,
                  fontWeight: FontWeight.w800,
                  fontSize: 64,
                ),
              ),
              // Refresh Button
              RawMaterialButton(
                onPressed: _resetAll,
                elevation: 0.0,
                fillColor: Colors.white70,
                padding: const EdgeInsets.all(15.0),
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.refresh,
                  size: 28.0,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
