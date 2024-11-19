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
  // Methods for "HEAD"
  void _incrementHCounter() {
    setState(() {
      _hCounter++;
    });
  }

  void _subtractHCounter() {
    setState(() {
      if (_hCounter > 0) _hCounter--;
    });
  }

  // Methods for "ARM"
  void _incrementACounter() {
    setState(() {
      _aCounter++;
    });
  }

  void _subtractACounter() {
    setState(() {
      if (_aCounter > 0) _aCounter--;
    });
  }

  // Methods for "LEG"
  void _incrementLCounter() {
    setState(() {
      _lCounter++;
    });
  }

  void _subtractLCounter() {
    setState(() {
      if (_lCounter > 0) _lCounter--;
    });
    // Methods for Total Robot Assembled Count
  }

  // Methods for "ASSEMBLE"
  void _assembleRobot() {
    setState(() {
      _reset();
      _robotsAssembled++;
    });
  }

  void _reset() {
    setState(() {
      _hCounter = 0;
      _aCounter = 0;
      _lCounter = 0;
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
              // Top "HEAD" Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RawMaterialButton(
                    onPressed: _subtractHCounter,
                    elevation: 0.0,
                    fillColor: Colors.red,
                    padding: const EdgeInsets.all(15.0),
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.remove_circle,
                      size: 28.0,
                      color: Colors.white,
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                    ),
                    icon: const Icon(
                      Icons.face_5,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    label: const Text(
                      'HEAD',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 4,
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                      ),
                    ),
                    onPressed: _incrementHCounter,
                  ),
                ],
              ),
              Text(
                '$_hCounter/2',
                style: const TextStyle(
                  color: Colors.black12,
                  letterSpacing: 4,
                  fontWeight: FontWeight.w800,
                  fontSize: 36,
                ),
              ),
              // Middle "ARM" Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RawMaterialButton(
                    onPressed: _subtractACounter,
                    elevation: 0.0,
                    fillColor: Colors.red,
                    padding: const EdgeInsets.all(15.0),
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.remove_circle,
                      size: 28.0,
                      color: Colors.white,
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 38, vertical: 20),
                    ),
                    icon: const Icon(
                      Icons.pan_tool,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    label: const Text(
                      'ARM',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 4,
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                      ),
                    ),
                    onPressed: _incrementACounter,
                  ),
                ],
              ),
              Text(
                '$_aCounter/5',
                style: const TextStyle(
                  color: Colors.black12,
                  letterSpacing: 4,
                  fontWeight: FontWeight.w800,
                  fontSize: 36,
                ),
              ),
              // Bottom :LEG" Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RawMaterialButton(
                    onPressed: _subtractLCounter,
                    elevation: 0.0,
                    fillColor: Colors.red,
                    padding: const EdgeInsets.all(15.0),
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.remove_circle,
                      size: 28.0,
                      color: Colors.white,
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 42, vertical: 20),
                    ),
                    icon: const Icon(
                      Icons.ice_skating_rounded,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    label: const Text(
                      'LEG',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 4,
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                      ),
                    ),
                    onPressed: _incrementLCounter,
                  ),
                ],
              ),
              Text(
                '$_lCounter/3',
                style: const TextStyle(
                  color: Colors.black12,
                  letterSpacing: 4,
                  fontWeight: FontWeight.w800,
                  fontSize: 36,
                ),
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
                onPressed: _reset,
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
