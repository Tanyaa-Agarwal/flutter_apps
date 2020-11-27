import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    home: Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('I am Poor'),
      ),
        backgroundColor: Colors.black,
      body: Center(
        child: Image(
          image: AssetImage('images/IMG_20190820_195154_Bokeh.jpeg')
        ),
      )
    ),
  )
  );
}



