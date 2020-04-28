import 'dart:convert';
import 'characterDetails.dart';
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
        Uri.encodeFull("https://rickandmortyapi.com/api/character/1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320"),
        
    );

    setState(() {
      // Get the JSON data
      data = json.decode(response.body);
    });

    return "Successfull";
  }
  @override
  void initState() { 
    super.initState();
    this.getJSONData();
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
                physics:BouncingScrollPhysics(),
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
                     "Top for my bio 😉",
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
