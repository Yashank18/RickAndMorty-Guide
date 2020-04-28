import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class details extends StatefulWidget {
  int id;
  String name;
  String species;
  String gender;
  String origin;
  String location;
  String image;
  String status;
  String created;
  details({Key key,@required created,@required this.id,@required name, @required status,@required this.species, @required this.gender, @required this.origin, @required this.location,@required this.image}) : super(key: key);
 
  @override
  _detailsState createState() => _detailsState();
}

class _detailsState extends State<details> {
  
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
              appBar: new AppBar(
                backgroundColor:Color.fromRGBO(45, 62, 80, 1),
                leading: InkWell(onTap: (){Navigator.pop(context);},child: Icon(Icons.arrow_back_ios,color:Colors.red)),
                title: Text("${widget.name}",style: GoogleFonts.varelaRound(textStyle:TextStyle(color:Colors.red)),),
              ),
              body: Container(
                height: screenHeight,
                width: screenWidth,
                color:Color.fromRGBO(45, 62, 80, 1),
                child:ListView(
                  children: <Widget>[ SizedBox(height: screenHeight*0.03,),
                          Image.network('${widget.image}',height: screenHeight*0.4,width: screenWidth*0.7,),
                          SizedBox(height: screenHeight*0.03,),
                          Text("${widget.name}",style: GoogleFonts.specialElite(textStyle:TextStyle(fontSize: 35,color:Colors.red))),
                          SizedBox(height: screenHeight*0.07,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                
                                child: Text("Gender - ${widget.gender}",style: GoogleFonts.specialElite(textStyle:TextStyle(fontSize: 20,color:Colors.red))),
                              ),
                              SizedBox(height: screenHeight*0.02,),
                              Container(
                                
                                child: Text("Species - ${widget.species}",style: GoogleFonts.specialElite(textStyle:TextStyle(fontSize: 20,color:Colors.red))),
                              ),
                            ],
                          ),
                           SizedBox(height: screenHeight*0.07,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                
                                child: Text("Status - ${widget.status}",style: GoogleFonts.specialElite(textStyle:TextStyle(fontSize: 20,color:Colors.red))),
                              ),
                              SizedBox(height: screenHeight*0.02,),
                              Container(
                                
                                child: Text("Created - ${widget.created}",style: GoogleFonts.specialElite(textStyle:TextStyle(fontSize: 18,color:Colors.red))),
                              ),
                            ],
                          )
                  ],
                )
              ),
      ),
          ),
    );
  }
}