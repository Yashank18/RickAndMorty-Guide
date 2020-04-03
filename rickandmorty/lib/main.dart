import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Rick and Morty'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    return SafeArea(
          child: Scaffold(
        
        body: Container(
          color: Color.fromRGBO(45, 62, 80, 1),
          height: screenHeight,
          width: screenWidth,
          child:Center(child: Column(
            
            children: <Widget>[
              SizedBox(height: screenHeight*0.16,),
              Text("Rick",style:GoogleFonts.bangers(textStyle:TextStyle(fontWeight: FontWeight.w900,fontSize: screenHeight*0.2,color:Colors.red))),
              Text("and",style:GoogleFonts.bangers(textStyle:TextStyle(fontWeight: FontWeight.w900,fontSize: screenHeight*0.2,color:Colors.red))),
              Text("Morty",style:GoogleFonts.bangers(textStyle:TextStyle(fontWeight: FontWeight.w900,fontSize: screenHeight*0.2,color:Colors.red))),
               SizedBox(height: screenHeight*0.135,),
               Text("Fan App V 1.0.0",style:GoogleFonts.bangers(textStyle:TextStyle(fontWeight: FontWeight.w900,fontSize: screenHeight*0.02,color:Colors.red))),

            ],
          )),
        ),
      ),
    );
  }
}
