import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {
  
  String time = '';
  String flag;
  String url;
  String location;
  bool isDayLight = false;

  WorldTime(this.url, this.location, this.flag);

  Future<void> getTime() async {

    try{
      var uri = Uri.parse('https://worldtimeapi.org/api/timezone/$url');

      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(uri);
      var date = convert.jsonDecode(response.body) as Map<String, dynamic>;
      String dateTime = date['datetime'];
      String offset = date['utc_offset'].substring(1,3);
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDayLight = now.hour > 6 && now.hour < 20 ? true : false ;
      // set now to time
      time = DateFormat.jm().format(now);
    }
    catch(e){
      time = 'error';
    }

  }

}