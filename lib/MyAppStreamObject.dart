import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';


class MyAppStreamObject{
  MyAppStreamObject(StreamingSharedPreferences preferences)
      : registerDate = preferences.getString("registerDate", defaultValue: DateTime.now().toString()) , paket = preferences.getInt("paket", defaultValue: 1);

  final Preference<String> registerDate;
  final Preference<int> paket;
}


