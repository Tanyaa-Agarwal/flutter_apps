import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.teal,
          body:SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage('images/tanya.jpeg'),
              ),
              Text(
              'Tanya',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.white
              ),
              ),
             Text(
               'FLUTTER DEVELOPER',
               style: TextStyle(
                 fontSize: 20.0,
                   fontWeight: FontWeight.bold,
                 letterSpacing: 2.5,
                 color: Colors.white,
                   fontFamily:'Source Sans Pro'

               ),
             ),
              SizedBox(
                height: 20.0,
                width:150.0,
                child: Divider(
                  color: Colors.white,

                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 20.0,horizontal: 25.0),

                child:ListTile(
                  leading:Icon(
                    Icons.phone,
                    color: Colors.blueAccent,) ,
                  title: Text(
                    '8630112968',
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20.0,
                    ),),
                )
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 20.0,horizontal: 25.0),
                 child: ListTile(
                  leading: Icon(
                      Icons.email,
                      color: Colors.teal,),
                    title: Text(
                      'tanyasja@gmail.com',
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                      ),
                  ),
                  ),),
                    ],
                  ),
                ),
              ),
            );

  }
}

