import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';

class StepCounter extends StatefulWidget {
  @override
  _StepCounterState createState() => _StepCounterState();
}

class _StepCounterState extends State<StepCounter> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?', _calories = '0.00';
  bool isCounting = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    setState(() {
      _steps = event.steps.toString();
      _calories = calculateCalories(event.steps).toStringAsFixed(2);
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    setState(() {
      _status = 'Pedestrian Status not available';
    });
  }

  void onStepCountError(error) {
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  double calculateCalories(int steps) {
    const double caloriesPerStep = 0.05;
    return steps * caloriesPerStep;
  }

  void startCounting() {
    setState(() {
      isCounting = true;
    });
  }

  void pauseCounting() {
    setState(() {
      isCounting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pedometer Step Counter'),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(39, 68, 114, 0.8),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topCenter,
              colors: [Color(0xFF5885AF), Color(0xFFC3E0E5)],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: isCounting ? null : startCounting,
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Start', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: isCounting ? pauseCounting : null,
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Pause', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Steps Taken',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          _steps,
                          style: TextStyle(fontSize: 40),
                        ),
                      ],
                    ),
                    SizedBox(width: 40),
                    Column(
                      children: [
                        const Text(
                          'Calories Burned',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          _calories,
                          style: TextStyle(fontSize: 40),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Pedestrian Status',
                  style: TextStyle(fontSize: 20),
                ),
                Icon(
                  _status == 'walking'
                      ? Icons.directions_walk
                      : _status == 'stopped'
                          ? Icons.accessibility_new
                          : Icons.error,
                  size: 100,
                ),
                Center(
                  child: Text(
                    _status,
                    style: _status == 'walking' || _status == 'stopped'
                        ? TextStyle(fontSize: 30)
                        : TextStyle(fontSize: 20, color: Colors.red),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}