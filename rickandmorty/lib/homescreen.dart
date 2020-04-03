import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class homescreen extends StatefulWidget {
  homescreen({Key key}) : super(key: key);

  @override
  _homescreenState createState() => _homescreenState();
}

class _homescreenState extends State<homescreen>
with SingleTickerProviderStateMixin  {
   AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 7),
    );

    animationController.repeat();
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    return SafeArea(
          child: WillPopScope(
        onWillPop: (){
          Navigator.pop(context);
        },
        child: Scaffold(
       body:Container(
         height: screenHeight,
         color: Color.fromRGBO(45, 62, 80, 1),
         child: ListView(
           physics: BouncingScrollPhysics(),
           children: <Widget>[
              SizedBox(height: screenHeight*0.1,),
              
              
              Image.asset("Images/rick-face-png-6.png",height: screenHeight*0.5,width: screenWidth*0.5,),
              SizedBox(height:screenHeight*0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  AnimatedBuilder(
                    animation: animationController,
                    child: Container(
                      
                      height: screenHeight*0.2,
                      width: screenWidth*0.35,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(45, 62, 80, 1),
                        image: DecorationImage(image: AssetImage("Images/bg.png",),fit: BoxFit.cover,),
                        border: Border.all(color: Color.fromRGBO(45, 62, 80, 1),),
                      ),
                      child: Center(child: Text("Character Of The day",textAlign: TextAlign.center,style: GoogleFonts.russoOne(textStyle:TextStyle(fontSize: 20.0)),),),
                    ),
                    builder: (BuildContext context, Widget _widget) {
                    return new Transform.rotate(
                      angle: animationController.value * 6.3,
                      child: _widget,
                    );
        },
                  ),
                   AnimatedBuilder(
                    animation: animationController,
                    child: Container(
                      
                      height: screenHeight*0.2,
                      width: screenWidth*0.35,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(45, 62, 80, 1),
                        image: DecorationImage(image: AssetImage("Images/bg.png",),fit: BoxFit.cover,),
                        border: Border.all(color: Color.fromRGBO(45, 62, 80, 1),),
                      ),
                      child: Center(child: Text("Cooked Book",textAlign: TextAlign.center,style: GoogleFonts.russoOne(textStyle:TextStyle(fontSize: 20.0)),),),
                    ),
                    builder: (BuildContext context, Widget _widget) {
                    return new Transform.rotate(
                      angle: animationController.value * -6.3,
                      child: _widget,
                    );
        },
                  ),
                  
                ],
              ),
           ],
         ),
         ),
         
      ),
          ),
    );
  }
}