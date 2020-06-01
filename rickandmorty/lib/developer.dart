import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Developer extends StatelessWidget {
  const Developer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:  new AppBar(
             backgroundColor:Color.fromRGBO(45, 62, 80, 1),
             leading: InkWell(onTap: (){Navigator.pop(context);},child: Icon(Icons.arrow_back_ios,color:Colors.red)),
                title: Text("Developer",style: GoogleFonts.varelaRound(textStyle:TextStyle(color:Colors.red)),),),
                body: Container(
                  height: screenHeight,
                width: screenWidth,
                color:Color.fromRGBO(45, 62, 80, 1),
                  child: ListView(
              
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[ SizedBox(height: screenHeight*0.03,),
                          Image.network("https://avatars3.githubusercontent.com/u/46098062?s=400&u=3f8f41d50047cd2e1c2d512b3b130c949494b00d&v=4",height: screenHeight*0.4,width: screenWidth*0.7,),
                          SizedBox(height: screenHeight*0.03,),
                          Text("Yashank",style: GoogleFonts.specialElite(textStyle:TextStyle(fontSize: 35,color:Colors.red)),textAlign: TextAlign.center),
                          SizedBox(height: screenHeight*0.07,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                
                                child: Text("Gender - Male",style: GoogleFonts.specialElite(textStyle:TextStyle(fontSize: 20,color:Colors.red))),
                              ),
                              SizedBox(height: screenHeight*0.02,),
                              Container(
                                
                                child: Text("Species - Human",style: GoogleFonts.specialElite(textStyle:TextStyle(fontSize: 20,color:Colors.red))),
                              ),
                            ],
                          ),
                           SizedBox(height: screenHeight*0.07,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                
                                child: Text("Status - Alive",style: GoogleFonts.specialElite(textStyle:TextStyle(fontSize: 20,color:Colors.red))),
                              ),
                              SizedBox(height: screenHeight*0.02,),
                              Container(
                                
                                child: Text("Created - 17 . 09 . 1999",style: GoogleFonts.specialElite(textStyle:TextStyle(fontSize: 18,color:Colors.red))),
                              ),
                            ],
                          )
                  ],
                      
                      //Center(child: , width: screenWidth*0.5, ),)
                    
                  ),
                ),
    );
  }
}