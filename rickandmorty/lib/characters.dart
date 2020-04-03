import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class characters extends StatefulWidget {
  characters({Key key}) : super(key: key);

  @override
  _charactersState createState() => _charactersState();
}


class _charactersState extends State<characters> {
  
  List data;

  // Function to get the JSON data
  Future<String> getJSONData() async {
    var response = await http.get(
        // Encode the url
        Uri.encodeFull("https://rickandmortyapi.com/api/character/"),
        
    );

    setState(() {
      // Get the JSON data
      data = json.decode(response.body)['results'];
    });

    return "Successfull";
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
                title: Text("Characters",style: GoogleFonts.varelaRound(textStyle:TextStyle(color:Colors.red)),),
          ),
          body: Container(
            color:Color.fromRGBO(45, 62, 80, 1),
              child: ListView.builder(
                itemCount: data == null ? 0 : data.length,
                itemBuilder: (context, index) {
                    return _build(data[index],screenHeight);
                    // return _buildRow(data[index]);
                  }
              ),
            
          ),
        ),
      ),
    );
  }
}
Widget _build(dynamic item,double screenh)=> Card(
  child:Text(item['name'])
);