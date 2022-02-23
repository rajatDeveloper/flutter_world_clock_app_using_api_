import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_loc_page.dart';
import 'package:world_time/pages/home_page.dart';
import 'package:world_time/pages/loading_page.dart';
import 'package:world_time/utils/routes.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,

    initialRoute: MyRoutes.loadRoute,
    routes: {
      MyRoutes.homeRoute : (context) =>   HomePage(),
      MyRoutes.loadRoute : (context) =>  LoadPage(),
      MyRoutes.chooseRoute : (context) =>  ChooseLocPage()
    }
  )
  );//runApp
}

// 34 to start
