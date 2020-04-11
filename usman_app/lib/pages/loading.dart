import "package:usman_app/Custom_Services/CustomRegionInfo.dart";
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
 
  void initializeInstance() async
  {
      CustomInfo currentInfo = CustomInfo(location:"Pakistan",locationUrl:"Pakistan",flag: "pak.jpg",location_ISO: 'PAK' );
      await currentInfo.getData();
      Navigator.pushReplacementNamed(context, '/home',arguments: {
        'flag': currentInfo.flag,
        'capital':currentInfo.capital,
        'population':currentInfo.population,
        'time':currentInfo.time,
        'location':currentInfo.location,
        'covid_confirm':currentInfo.covid_confirm,
        'covid_deaths' :currentInfo.covid_deaths,
        'covid_recovered' :currentInfo.covid_recovered
      });
  }

  @override
  void initState() {
    super.initState();
    initializeInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitRotatingCircle(
        color: Colors.white,
         size: 50.0,
        ),
      )
    );
  }
}