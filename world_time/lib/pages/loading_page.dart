
import 'package:flutter/material.dart';
import 'package:world_time/models/world_time_data.dart';
import 'package:world_time/pages/home_page.dart';
import 'package:world_time/utils/routes.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({Key? key}) : super(key: key);

  @override
  _LoadPageState createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {

  void setUpWorldTime() async {
    WorldTime instance = WorldTime(
        location: "Kolkata",
        flag: "india.png",
        url_loc: "Asia/Kolkata"
    );
    await instance.getTime();



    Navigator.pushReplacementNamed(context, MyRoutes.homeRoute,arguments: {
      'location' : instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime,
    });//using this we remove this page from route stack


  }

  @override
  void initState() {

    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(color: Colors.black,),
      ),
    );
  }
}




// 28 to start