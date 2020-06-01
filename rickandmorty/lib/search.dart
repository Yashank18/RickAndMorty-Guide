import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rickandmorty/characters.dart';
import 'package:rickandmorty/searchResults.dart';

class search extends StatefulWidget {
   
  String option;
  search({Key key,@required this.option}) : super(key: key);

  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  final myController = TextEditingController();
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
                title: Text("Search by ${widget.option}",style: GoogleFonts.varelaRound(textStyle:TextStyle(color:Colors.red)),),
          ),
          body: Container(
            height: screenHeight,
                width: screenWidth,
                color:Color.fromRGBO(45, 62, 80, 1),
               
            child:ListView(
              
              children: <Widget>[
                Image.asset('Images/wubba.png',height: screenHeight*0.5),
                
                SizedBox(height: screenHeight*0.05,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                          Navigator.push(context, new MaterialPageRoute(builder: (__) => new characters()));
                      },
                        child: Container(
                        height: screenHeight*0.08,
                        width: screenWidth*0.8,
                        color: Colors.blue.shade100.withOpacity(0.1),
                        child: Center(child: TextField(
                          controller: myController,
                          cursorColor: Colors.red,
                          style: GoogleFonts.varelaRound(textStyle:TextStyle(height: 2.0,color: Colors.red)),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: "Enter Name",
                            hintStyle: GoogleFonts.varelaRound(textStyle:TextStyle(color:Colors.red)),
                            enabledBorder:  UnderlineInputBorder(      
                            borderSide: BorderSide(color: Colors.red),
                            ),  
                          ),
                        )),
                      ),
                    ),
                    SizedBox(height:screenHeight*0.04),
                    InkWell(
                      onTap: (){
                       
                         Navigator.push(context, new MaterialPageRoute(builder: (__) => new searchone(option: myController.text,option2: "",title:myController.text)));
                         
                      },
                         child: Container(
                           decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                             color: Colors.blue.shade100.withOpacity(0.1),
                          ),
                        height: screenHeight*0.08,
                        width: screenWidth*0.4,
                        child: Center(child:Text("Search",style: GoogleFonts.varelaRound(textStyle:TextStyle(color: Colors.red,fontSize: 25)),)),
                      ),
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