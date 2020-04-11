import 'package:flutter/material.dart';
import "package:usman_app/Custom_Services/CustomRegionInfo.dart";
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

 String message = 'Chose your Location';

List <CustomInfo> mylist = [
 new CustomInfo(location:"Pakistan",locationUrl:"Pakistan",flag: "pak.jpg",location_ISO: 'PAK' ),
 new CustomInfo(location: "Egypt",locationUrl:'Egypt' ,flag:"egypt.png", location_ISO: 'EGY'),
 new CustomInfo(location: "Germany",locationUrl:'Germany' ,flag:"germany.png",location_ISO: 'DEU' ),
 new CustomInfo(location: "Greece",locationUrl:'Greece' ,flag:"greece.png" ,location_ISO: 'GRC'),
 new CustomInfo(location: "Indonesia",locationUrl:'Indonesia' ,flag:"indonesia.png", location_ISO: 'IDN'),
 new CustomInfo(location: "Kenya",locationUrl:'Kenya' ,flag:"kenya.png", location_ISO: 'KEN'),
 new CustomInfo(location: "United Kingdom",locationUrl:'United Kingdom' ,flag:"uk.png" ,location_ISO: 'GBR'),
 new CustomInfo(location: "United States of America",locationUrl:'United States of America' ,flag:"usa.png" ,location_ISO: 'USA')
];
updateLocation(int index) async
{
  CustomInfo mynewLoc =  mylist[index];
  setState(() {
    message = '!!!!!!!!!Loading!!!!!!!!!';
  });
  await mynewLoc.getData();
  // Navigate back to home screen
  Navigator.pop(context,{
    'flag': mynewLoc.flag,
    'capital': mynewLoc.capital,
    'population': mynewLoc.population,
    'time': mynewLoc.time,
    'location': mynewLoc.location,
    'covid_confirm':mynewLoc.covid_confirm,
    'covid_deaths' :mynewLoc.covid_deaths,
    'covid_recovered' :mynewLoc.covid_recovered
  });
  message = 'Chose your Location';
}

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(message),
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 0.0,
      ),
       body: ListView.builder(
         itemCount: mylist.length,
         itemBuilder: (context,index){
           return Padding(
             padding: EdgeInsets.symmetric(vertical: 10.0),
             child: Card(
               child: ListTile(
                 onTap: () {
                      updateLocation(index);
                 },
                 title: Text(mylist[index].location),
                 leading: CircleAvatar(
                   backgroundImage: AssetImage('lib/Assets/${mylist[index].flag}'),
                 ),
               ),
             ),
           );
         }
         ),
    );
  }
}