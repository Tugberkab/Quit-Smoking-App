class Time{

  //members
  int years;
  int months;
  int weeks ;
  int days ;
  int hours ;
  int minutes ;
  int seconds ;


  //member function
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

  Time()
      : years=0, months=0, weeks=0, days=0, hours=0, minutes=0, seconds=0;

  //CONSTRUCTOR
  Time.fromDuration(Duration duration) : years=0, months=0, weeks=0, days=0, hours=0, minutes=0, seconds=0
  {
    Map data = parseDate(duration);
    years = data["years"] ;
    months = data["months"] ;
    weeks = data["weeks"] ;
    days = data["days"] ;
    hours = data["hours"] ;
    minutes = data["minutes"] ;
    seconds = data["seconds"] ;

  }
}


//GLOBAL FUNCTION, this will parse date into days, months etc and return a map
