import 'package:flutter/material.dart';
import 'package:world_time/service/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({ Key? key }) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

    List<WorldTime> locations = [
    WorldTime('Africa/Cairo', 'Cairo', 'egypt.png'),
    WorldTime('Europe/London', 'London', 'uk.png'),
    WorldTime('Asia/Seoul', 'Seoul', 'south_korea.png'),
    WorldTime('Africa/Nairobi', 'Nairobi', 'kenya.png'),
    WorldTime('Europe/Berlin', 'Athens', 'greece.png'),
    WorldTime('America/Chicago', 'Chicago', 'usa.png'),
    WorldTime('Asia/Jakarta', 'Jakarta', 'indonesia.png'),
    WorldTime('America/New_York', 'New York', 'usa.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'url': instance.url,
      'isDayLight': instance.isDayLight,
      'time': instance.time,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Choose location'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0), // get padding leftright and updown
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                    },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}