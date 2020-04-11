import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

   Map myData ={};

  @override
  Widget build(BuildContext context) {
    myData = myData.isNotEmpty ? myData : ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(0,0,0,0),
                child: SafeArea(
            child: DecoratedBox(
              decoration: BoxDecoration(
     image: DecorationImage(image: AssetImage("lib/Assets/${myData['flag']}"), fit: BoxFit.cover),
    ),
                        child: Container(
                          color: Color.fromARGB(150, 255, 255, 255),
                                                child: Column(
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(()  {
                          myData = {
                            'flag': result['flag'],
                            'capital':result['capital'],
                            'population':result['population'],
                            'time':result['time'],
                            'location':result['location'],
                            'covid_confirm':result["covid_confirm"],
                            'covid_deaths' :result["covid_deaths"],
                            'covid_recovered' :result["covid_recovered"]
                          };
                      });
                    }, 
                    icon: Icon(Icons.edit_location), 
                    label: Text('Change your location'),
                    ),
                    SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(myData['location'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                            ),
                      ),

                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(myData['time'],
                  style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                            ),
                  ),
                  SizedBox(height: 40.0),
                  Text('Capital :   ' + myData['capital'],
                  style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                  SizedBox(height: 10.0),
                  Text('Population : ' + myData['population'],
                  style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                  SizedBox(height: 10.0),
                  Container(
                    padding: EdgeInsets.fromLTRB(40.0,10.0,40.0,10.0),
                    color: Color.fromARGB(150, 26, 25, 25),
                    child: Column(
                      children: <Widget>[
                        Text('COVID-19',
                              style: TextStyle(
                              fontSize: 27.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            ),
                          Text('Infected: ' + myData['covid_confirm'],
                              style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            ),
                            Text('Recovered : ' + myData['covid_recovered'],
                              style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            ),
                            Text('Deaths : ' + myData['covid_deaths'],
                              style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            ),
                      ],
                    ),
                  ),
                  SizedBox(height: 250.0),
                Text('made by : Usman Farooq')
                ],
              ),
                        ),
            ),),
        ),
      ),
    );
  }
}