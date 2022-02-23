import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  late String location;
  late String time ;
  late String flag;
  late String url_loc ;
  late bool isDayTime ;

  WorldTime({
    required this.location,
    required this.flag,
    required this.url_loc,
  });

  Future<void> getTime() async{

    try{

      final url = Uri.https('worldtimeapi.org', 'api/timezone/$url_loc');
      final response = await http.get(url);

      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));


      //daytime
      isDayTime = now.hour > 6 && now.hour > 15? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(e){
        time = "could not get the time data";
    }




  }


}


