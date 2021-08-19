import 'dart:convert';

import 'package:http/http.dart' as httpClient;
class APIServices{
  //api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
  Future getWeather(String city)async{
    final para={"q":city,"appid":"000294b96d4c2ca1083d38b9920ce59a"};
    final url=Uri.https('api.openweathermap.org', '/data/2.5/weather');
    final respone= await httpClient.get(url);
    print(respone.body);
    final json=jsonDecode(respone.body);
    print(json['main']);
    // hello all
  }


}