import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';


class MyAppStreamObject{
  MyAppStreamObject(StreamingSharedPreferences preferences)
      : registerDate = preferences.getString("registerDate", defaultValue: DateTime.now().toString());

  final Preference<String> registerDate;
}


//GLOBAL FUNCTION, this will parse date into days, months etc and return a map
Map<String,int> parseDate(Duration duration){
  Map<String,int> data = {};

  int totalSeconds = duration.inSeconds;

  int years = totalSeconds ~/ (365*24*60*60);
  int months = (totalSeconds - years*(365*24*60*60)) ~/ (30*24*60*60);
  int weeks = (totalSeconds - years*(365*24*60*60) - months*(30*24*60*60) ) ~/ (7*24*60*60);
  int days = (totalSeconds -years*(365*24*60*60) - months*(30*24*60*60) - weeks*(7*24*60*60)) ~/ (24*60*60);
  int hours = (totalSeconds -years*(365*24*60*60) - months*(30*24*60*60) - weeks*(7*24*60*60) - days*(24*60*60)) ~/ (60*60);
  int minutes = (totalSeconds -years*(365*24*60*60) - months*(30*24*60*60) - weeks*(7*24*60*60) - days*(24*60*60) - hours*(60*60)) ~/ 60;
  int seconds = (totalSeconds -years*(365*24*60*60) - months*(30*24*60*60) - weeks*(7*24*60*60) - days*(24*60*60) - hours*(60*60) - minutes*60);


  data["years"] = years;
  data["months"] = months;
  data["weeks"] = weeks;
  data["days"] = days;
  data["hours"] = hours;
  data["minutes"] = minutes;
  data["seconds"] = seconds;

  return data;
}