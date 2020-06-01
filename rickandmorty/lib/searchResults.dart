import 'dart:convert';

import 'characterDetails.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class searchone extends StatefulWidget {
  String option,option2;
  String title;
  searchone({Key key,@required this.option,this.option2,@required this.title}) : super(key: key);

  @override
  _searchoneState createState() => _searchoneState();
}


class _searchoneState extends State<searchone> {
  
  List data;

  // Function to get the JSON data
  Future<String> getJSONData(String url) async {
    var response = await http.get(
        // Encode the url
        Uri.encodeFull(url),
    );

    setState(() {
      // Get the JSON data
      data = json.decode(response.body)['results'];
    });

    return "Successfull";
  }
  @override
  void initState() { 
    super.initState();
    this.getJSONData("https://rickandmortyapi.com/api/character/?name="+widget.option.toLowerCase()+widget.option2.toLowerCase());
  }
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
                title: Text(widget.title,style: GoogleFonts.varelaRound(textStyle:TextStyle(color:Colors.red)),),
          ),
          body: Container(
            color:Color.fromRGBO(45, 62, 80, 1),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: data == null ? 0 : data.length,
                itemBuilder: (BuildContext context, index) {
                  return  InkWell( 
              onTap: (){
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => details(id:index,name:data[index]['name'],status: data[index]['status'],created: data[index]['created'],image: data[index]['image'],origin: data[index]['origin']['name'],gender: data[index]['gender'],species: data[index]['species'],location: data[index]['location']['name'],)),
                    );
                    },
              child: Card(
              color:Colors.red.shade400,
              margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
              elevation: 4.0,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
               mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                    Image.network(
                        
                          data[index]['image'],
                        
                        height: MediaQuery.of(context).size.height / 2,
                        fit: BoxFit.cover,
                    ),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 16.0, bottom: 4.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        data[index]['name'],
                        style:GoogleFonts.varelaRound(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color.fromRGBO(45, 62, 80, 1)),
                      ),
                      ),
                    ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                    child: Text(
                     data[index]['species']+" , "+ data[index]['gender'] +' and '+data[index]['status']+" from "+data[index]['origin']['name'],
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Color.fromRGBO(45, 62, 80, 1)),
                    ),
                ),
                ]
              )
              
            ),
                  );
                    
                    // return _buildRow(data[index]);
                  }
              ),
            
          ),
        ),
      ),
    );
  }
}
