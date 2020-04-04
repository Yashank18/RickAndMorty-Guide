import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rickandmorty/characters.dart';
import 'package:rickandmorty/searchResults.dart';

class advanced extends StatefulWidget {
   
  
  advanced({Key key}) : super(key: key);

  @override
  _advancedState createState() => _advancedState();
}

class _advancedState extends State<advanced> {
  final myController = TextEditingController();
  final myController2 = TextEditingController();
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
                title: Text("Advanced Search",style: GoogleFonts.varelaRound(textStyle:TextStyle(color:Colors.red)),),
          ),
          body: Container(
            height: screenHeight,
                width: screenWidth,
                color:Color.fromRGBO(45, 62, 80, 1),
               
            child:ListView(
              
              children: <Widget>[
                
                Image.network("https://lh3.googleusercontent.com/proxy/9lwcxbeuDWIVxep05I8LSgs7gsdOMKoWGSCyUa287KXQFceNvCKtR8UO4hRoeoz-41fNxd6WyUg5zf1VkGz4hH9svUFamkTx2TfywqfEaInduB-Sar76ma1qjKoQi2NpzzI",height: screenHeight*0.48,width: screenWidth*0.9,),
                
                SizedBox(height: screenHeight*0.04,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
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
                    
                    SizedBox(height:screenHeight*0.04),
                    Container(
                        height: screenHeight*0.08,
                        width: screenWidth*0.8,
                        color: Colors.blue.shade100.withOpacity(0.1),
                        child: Center(child: TextField(
                          controller: myController2,
                          cursorColor: Colors.red,
                          style: GoogleFonts.varelaRound(textStyle:TextStyle(height: 2.0,color: Colors.red)),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: "Enter Status (Living or Dead)",
                            hintStyle: GoogleFonts.varelaRound(textStyle:TextStyle(color:Colors.red)),
                            enabledBorder:  UnderlineInputBorder(      
                            borderSide: BorderSide(color: Colors.red),   
                            ),  
                          ),
                        )),
                      ),
                    
                    SizedBox(height:screenHeight*0.04),
                    InkWell(
                      onTap: (){
                       
                         Navigator.push(context, new MaterialPageRoute(builder: (__) => new searchone(option: myController.text,option2:"&status="+myController2.text)));
                         
                      },
                         child: Container(
                        height: screenHeight*0.08,
                        width: screenWidth*0.4,
                        color: Colors.blue.shade100.withOpacity(0.1),
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