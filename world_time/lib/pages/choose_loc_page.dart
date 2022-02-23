import 'package:flutter/material.dart';
import 'package:world_time/models/world_time_data.dart';


class ChooseLocPage extends StatefulWidget {
  const ChooseLocPage({Key? key}) : super(key: key);

  @override
  _ChooseLocPageState createState() => _ChooseLocPageState();
}

class _ChooseLocPageState extends State<ChooseLocPage> {



  @override
  Widget build(BuildContext context) {

    List<WorldTime> locations = [

      WorldTime(url_loc: "Asia/Kolkata", location: 'Kolkata', flag: 'india.jpg'),
      WorldTime(url_loc: 'Europe/London', location: 'London', flag: 'uk.png',),
      WorldTime(url_loc:  'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
      WorldTime(url_loc: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
      WorldTime(url_loc:  'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
      WorldTime(url_loc:  'America/Chicago', location: 'Chicago', flag: 'usa.png'),
      WorldTime(url_loc: 'America/New_York', location: 'New York', flag: 'usa.png'),
      WorldTime(url_loc: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
      WorldTime(url_loc: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),

    ];

    void updateTime(index) async{
      WorldTime instance = locations[index];
      await instance.getTime();
      //navigate to home screen
      Navigator.pop(context,{
        'location' : instance.location,
        'flag':instance.flag,
        'time':instance.time,
        'isDayTime':instance.isDayTime,
      });
    }

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Choose a Loaction"),
      centerTitle: true,),
      body: SafeArea(
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 8),
              child: Card(
                child: ListTile(
                  onTap: (){
                    print(locations[index].location);
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/${locations[index].flag}"),
                  ),
                )
                ,),
            );
          },
        ),
      )
    );
  }
}
