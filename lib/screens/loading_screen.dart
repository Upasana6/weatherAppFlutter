import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var position;

  Future getLocationData() async{
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();      

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData,);
    }));
  }

  @override
  void initState(){
    super.initState();
    position = getLocationData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitChasingDots(
            color: Colors.white,
            size: 50.0,
        )
      ),
    );
  }
}

