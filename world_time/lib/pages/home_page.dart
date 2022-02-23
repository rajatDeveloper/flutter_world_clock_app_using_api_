import 'package:flutter/material.dart';
import 'package:world_time/utils/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data = {};//empty map
  @override
  Widget build(BuildContext context) {

    data =  data.isNotEmpty ? data :  ModalRoute.of(context)!.settings.arguments as Map ;
    // print(data);
    //for backGround image 
    String bgImage = data['isDayTime']? "day.png": "night.png";

    return Scaffold(
      
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/day.png'),
              fit: BoxFit.cover
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 160.0, 0, 0),
            child: Column(
              children: [
                Center(
                  child: TextButton.icon(
                    onPressed: () async{
                    dynamic results = await Navigator.pushNamed(context,MyRoutes.chooseRoute);
                    setState(() {
                      data = {
                        'location' : results['location'],
                        'flag':results['flag'],
                        'time':results['time'],
                        'isDayTime':results['isDayTime'],
                      };
                    });
                  },
                    icon: Icon(Icons.location_on_sharp,size: 50,color: Colors.white,),
                    label: Text("Edit Location",textScaleFactor: 1.4,
                      style: TextStyle(color: Colors.white),),),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data['location'],textScaleFactor: 2.2,style: TextStyle(
                      letterSpacing: 2
                    ),
                    ),

                  ],
                ),
                SizedBox(height: 20,),
                Text(data['time'],
                  textScaleFactor: 4,
                  style: TextStyle(
                    letterSpacing: 2.0
                ),)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
