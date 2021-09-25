import 'package:flutter/material.dart';
import 'package:world_time/service/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({ Key? key }) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  
  String time = 'Loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime('Europe/London', 'London', 'uk.png');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: { // what we want to send to next page
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayLight': instance.isDayLight
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 50.0,
        ),
        ),
    );
  }
}