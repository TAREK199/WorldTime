
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


  class WorldTime{

 String location ; //location name for th ui
 String time ; // the time in the location
 String flag ; // url to an asset flag png
 String url ; // location url for api endpoints
 bool isDayTime ; // to knw is  day or night


  WorldTime({this.location,this.flag,this.url});

   Future <void> getTime () async {

    try{
     // make the request
     Response response = await get('http://worldtimeapi.org/api/timezone/$url');
     Map data = jsonDecode(response.body);

     // get properties from data
     String dateTime = data['datetime'];
     String offset = data['utc_offset'].substring(1, 3);

     // create datetime object
     DateTime now = DateTime.parse(dateTime);
     now = now.add(Duration(hours: int.parse(offset)));

     // set the time property

     isDayTime = now.hour>6 && now.hour<15 ? true : false ;
     time = DateFormat.jm().format(now);

    }
    catch(e){

     print('cough error : $e');
     time = 'time error';

    }

}

}