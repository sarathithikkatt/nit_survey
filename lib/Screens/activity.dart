import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:math' as math;

class ActivityScreen extends StatefulWidget {
  ActivityScreen({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  static const int _snakeRows = 20;
  static const int _snakeColumns = 20;
  static const double _snakeCellSize = 10.0;

  List<List<double>> _accList = [];
  List<List<double>> _uAccList = [];
  List<List<double>> _magList = [];
  List<List<double>> _gyrList = [];

  List<double>? _accelerometerValues = <double>[0, 0, 0];
  List<double>? _userAccelerometerValues = <double>[0, 0, 0];
  List<double>? _gyroscopeValues = <double>[0, 0, 0];
  List<double>? _magnetometerValues = <double>[0, 0, 0];
  final _streamSubscriptions = <StreamSubscription<dynamic>>[];

  @override
  Widget build(BuildContext context) {
    final accelerometer = _accelerometerValues?.map((double v) => v.toStringAsFixed(1)).toList();
    final gyroscope = _gyroscopeValues?.map((double v) => v.toStringAsFixed(1)).toList();
    final userAccelerometer = _userAccelerometerValues?.map((double v) => v.toStringAsFixed(1)).toList();
    final magnetometer = _magnetometerValues?.map((double v) => v.toStringAsFixed(1)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity tracking'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Accelerometer: $accelerometer'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('UserAccelerometer: $userAccelerometer'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Gyroscope: $gyroscope'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Magnetometer: $magnetometer'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  @override
  void initState() {
    super.initState();
    _streamSubscriptions.add(
      accelerometerEvents.listen(
        (AccelerometerEvent event) {
          if ((event.x - _accelerometerValues![0]).abs() > 3 ||
              (event.y - _accelerometerValues![1]).abs() > 3 ||
              (event.z - _accelerometerValues![2]).abs() > 3)
            setState(() {
              print(" acc: ${_accList.length} mag: ${_magList.length} uAcc: ${_uAccList.length} gyr: ${_gyrList.length} ");
              _accelerometerValues = <double>[event.x, event.y, event.z];
              _accList.add([event.x, event.y, event.z]);
            });
        },
      ),
    );
    _streamSubscriptions.add(
      gyroscopeEvents.listen(
        (GyroscopeEvent event) {
          if ((event.x - _gyroscopeValues![0]).abs() > 1 || (event.y - _gyroscopeValues![1]).abs() > 1 || (event.z - _gyroscopeValues![2]).abs() > 1)
            setState(() {
              _gyroscopeValues = <double>[event.x, event.y, event.z];
              _gyrList.add([event.x, event.y, event.z]);
            });
        },
      ),
    );
    _streamSubscriptions.add(
      userAccelerometerEvents.listen(
        (UserAccelerometerEvent event) {
          if ((event.x - _userAccelerometerValues![0]).abs() > 3 ||
              (event.y - _userAccelerometerValues![1]).abs() > 3 ||
              (event.z - _userAccelerometerValues![2]).abs() > 3)
            setState(() {
              _userAccelerometerValues = <double>[event.x, event.y, event.z];
              _uAccList.add([event.x, event.y, event.z]);
            });
        },
      ),
    );
    _streamSubscriptions.add(
      magnetometerEvents.listen(
        (MagnetometerEvent event) {
          if ((event.x - _magnetometerValues![0]).abs() > 3 ||
              (event.y - _magnetometerValues![1]).abs() > 3 ||
              (event.z - _magnetometerValues![2]).abs() > 3)
            setState(() {
              _magnetometerValues = <double>[event.x, event.y, event.z];
              _magList.add([event.x, event.y, event.z]);
            });
        },
      ),
    );
  }
}
