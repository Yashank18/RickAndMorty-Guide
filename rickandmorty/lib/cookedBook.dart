import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rickandmorty/characters.dart';

class cookedBook extends StatefulWidget {
  cookedBook({Key key}) : super(key: key);

  @override
  _cookedBookState createState() => _cookedBookState();
}

class _cookedBookState extends State<cookedBook> {
  
  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    return SafeArea(
      child: WillPopScope(
        onWillPop: (){Navigator.pop(context);},
        child: Scaffold(
          appBar: new AppBar(
             backgroundColor:Color.fromRGBO(45, 62, 80, 1),
             leading: InkWell(onTap: (){Navigator.pop(context);},child: Icon(Icons.arrow_back_ios,color:Colors.red)),
                title: Text("Cooked Book",style: GoogleFonts.varelaRound(textStyle:TextStyle(color:Colors.red)),),
          ),
          body: Container(
            height: screenHeight,
                width: screenWidth,
                color:Color.fromRGBO(45, 62, 80, 1),
            child:Column(
              
              children: <Widget>[
                SizedBox(height: screenHeight*0.05,),
                Image.network("https://www.cartoongoodies.com/wp-content/uploads/2019/11/Rick-and-Mortimer-running.png"),
                SizedBox(height: screenHeight*0.15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                          Navigator.push(context, new MaterialPageRoute(builder: (__) => new characters()));
                      },
                        child: Container(
                        height: screenHeight*0.15,
                        width: screenWidth*0.4,
                        color: Colors.blue.shade100.withOpacity(0.1),
                        child: Center(child:Text("Characters",style: GoogleFonts.varelaRound(textStyle:TextStyle(color: Colors.red,fontSize: 25)),)),
                      ),
                    ),
                    Container(
                      height: screenHeight*0.15,
                      width: screenWidth*0.4,
                      color: Colors.blue.shade100.withOpacity(0.1),
                      child: Center(child:Text("Locations",style: GoogleFonts.varelaRound(textStyle:TextStyle(color: Colors.red,fontSize: 25)),)),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight*0.04,),
                Container(
                      height: screenHeight*0.15,
                      width: screenWidth*0.9,
                      color: Colors.blue.shade100.withOpacity(0.1),
                      child: Center(child:Text("Episodes",style: GoogleFonts.varelaRound(textStyle:TextStyle(color: Colors.red,fontSize: 25)),)),
                    ),
              ],
            ),
          ),
        ),
        ),
    );
  }
}