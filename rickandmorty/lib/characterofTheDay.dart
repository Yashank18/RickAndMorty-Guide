import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
String url="https://rickandmortyapi.com/api/character/";
Random random = new Random();
int randomNumber = random.nextInt(300); 

Future<Shape> fetchAlbum() async {
  final response =
      await http.get(url+"${randomNumber}");

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Shape.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}


class Shape{
  String name;
  String status;
  String species;
  String gender;
  String image;
  String created;
  Shape({this.name,this.status,this.species,this.gender,this.image,this.created});
factory Shape.fromJson(Map<String, dynamic> json){
  return Shape(
     name: json['name'],
    status:json['status'],
    species: json['species'],
    gender:json['gender'],
    image:json['image'],
    created:json['created'],
    
  );
}
}

class CHaracterOfTheDay extends StatefulWidget {
  CHaracterOfTheDay({Key key}) : super(key: key);

  @override
  _CHaracterOfTheDayState createState() => _CHaracterOfTheDayState();
}

class _CHaracterOfTheDayState extends State<CHaracterOfTheDay> {
  Future<Shape> futureAlbum;
  @override
  void initState() {
   
    
    super.initState();
    futureAlbum = fetchAlbum();
    
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
              appBar: new AppBar(
                backgroundColor:Color.fromRGBO(45, 62, 80, 1),
                leading: InkWell(onTap: (){Navigator.pop(context);},child: Icon(Icons.arrow_back_ios,color:Colors.red)),
                title: Text("Character Of the Day",style: GoogleFonts.varelaRound(textStyle:TextStyle(color:Colors.red)),),
              ),
              body: Container(
                height: screenHeight,
                width: screenWidth,
                color:Color.fromRGBO(45, 62, 80, 1),
                child: FutureBuilder<Shape>(
                  future: futureAlbum,
                  builder: (context,snapshot){
                    if(snapshot.hasData){
                      return Column(  

                        children: <Widget>[
                          
                          SizedBox(height: screenHeight*0.03,),
                          Image.network('${snapshot.data.image}',height: screenHeight*0.4,width: screenWidth*0.7,),
                          SizedBox(height: screenHeight*0.03,),
                          Text("${snapshot.data.name}",style: GoogleFonts.specialElite(textStyle:TextStyle(fontSize: 35,color:Colors.red))),
                          SizedBox(height: screenHeight*0.07,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                
                                child: Text("Gender - ${snapshot.data.gender}",style: GoogleFonts.specialElite(textStyle:TextStyle(fontSize: 20,color:Colors.red))),
                              ),
                              SizedBox(height: screenHeight*0.02,),
                              Container(
                                
                                child: Text("Species - ${snapshot.data.species}",style: GoogleFonts.specialElite(textStyle:TextStyle(fontSize: 20,color:Colors.red))),
                              ),
                            ],
                          ),
                           SizedBox(height: screenHeight*0.07,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                
                                child: Text("Status - ${snapshot.data.status}",style: GoogleFonts.specialElite(textStyle:TextStyle(fontSize: 20,color:Colors.red))),
                              ),
                              SizedBox(height: screenHeight*0.02,),
                              Container(
                                
                                child: Text("Created - ${snapshot.data.created}",style: GoogleFonts.specialElite(textStyle:TextStyle(fontSize: 18,color:Colors.red))),
                              ),
                            ],
                          )

                        ],
                      );
                    }
                    else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
      ),
          ),
    );
  }
}