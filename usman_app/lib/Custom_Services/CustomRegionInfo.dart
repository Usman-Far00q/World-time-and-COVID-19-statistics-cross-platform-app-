import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class CustomInfo{
  String flag;
  String capital;
  String time;
  String population;
  String location; // used to isplay the name o the country on the UI
  String locationUrl; // used for filling up the blanks in the fet url ai endpoint
  String covid_confirm;
  String covid_deaths;
  String covid_recovered;
  String location_ISO;

  CustomInfo({this.location,this.locationUrl,this.flag,this.location_ISO}); // Constructor that sets appropriate values

  Future <void> getData() async{

    try{

      //making a request
    Response response = await get('https://restcountries.eu/rest/v2/name/$locationUrl/?fields=flag;capital;currencies;population;timezones');
    dynamic actual = jsonDecode(response.body); // converts the respose variable to list or map (depedns on what the api returns)
    this.capital = actual[0]['capital']; // string that tells th capital
    // this.population = actual[0]['population']; // integers that tells the population
    this.population = NumberFormat.compactLong().format((actual[0]['population']));
    String timezone = actual[0]['timezones'][0].toString().substring(3,6); // takes out a string that represents offset to the utc time
    var Time = new DateTime.now().toUtc(); // gives you the utc time
    // this.time = Time.add(Duration(hours: int.parse(timezone))).toString(); // utc + offsst = current time and date and we convert it to string
    this.time = DateFormat.jm().format(Time.add(Duration(hours: int.parse(timezone))));
    response = await get('https://covidapi.info/api/v1/country/$location_ISO/latest');
    actual = jsonDecode(response.body);
    List covid =[];
    actual = actual['result'].forEach((k,v)=>covid.add(v));
    this.covid_recovered = NumberFormat.compactLong().format(covid[0]['recovered']);
    this.covid_confirm = NumberFormat.compactLong().format(covid[0]['confirmed']);
    this.covid_deaths = NumberFormat.compactLong().format(covid[0]['deaths']);
    }
    catch(e)
        {
          print("error in fetching occured pleased staaaaap $e");
          this.capital = 'failed to fetch';
          this.time = 'failed to fetch';
          this.population = 'failed to fetch';
          this.covid_recovered = 'failed to fetch';
          this.covid_confirm = 'failed to fetch';
          this.covid_deaths = 'failed to fetch';
    }
    
  }

}