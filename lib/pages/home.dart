import 'package:flutter/material.dart';


  class Home extends StatefulWidget {
    @override
    _HomeState createState() => _HomeState();
  }

  class _HomeState extends State<Home> {
    Map data = {};
    @override
    Widget build(BuildContext context) {

      print('first data is $data');


        data = data.isEmpty ? ModalRoute.of(context).settings.arguments : data;
      print('last data is $data');

      // set background

      String backImg = data['isDayTime'] ? 'day.png' : 'night.png';
      Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];


      return Scaffold(
        backgroundColor: bgColor,

        body: SafeArea(
          child: Container(

            decoration: BoxDecoration(
                image: DecorationImage(
                     image: AssetImage('assets/$backImg'),
                     fit: BoxFit.cover,
                ),
            ),


            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 100.0, 0, 0),
              child: Column(

                children: <Widget>[
                  FlatButton.icon(onPressed: () async{
                     dynamic result = await Navigator.pushNamed(context, '/location');

                     setState(() {
                       data ={
                         'location' : result['location'],
                         'flag' : result['flag'],
                         'time ' : result['time'],
                         'isDayTime' : result['isDayTime'],
                       };
                     });
                  },
                      icon: Icon(Icons.location_on,
                      color: Colors.white,
                      ),
                      label: Text('go location',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      )
                  ),

                  SizedBox(height:20.0),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Text(
                          data['location']!=null ? data['location'] : 'default value',
                      style: TextStyle(
                        fontSize: 15.0,
                        letterSpacing: 2.0,
                        color: Colors.white
                      ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15.0),

                  Text(
                    data['time']!= null ? data['time']:'default value' ,
                    style: TextStyle(
                        fontSize: 25.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

