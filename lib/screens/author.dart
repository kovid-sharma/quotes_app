import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quotes_app/models/quotes.dart';

import '../services/api.dart';
TextEditingController _authorName= TextEditingController();
bool showResult=false;
bool isFav=false;
String currQuote='Dont Talk about what you have done or what you are going to do';
class author extends StatefulWidget {
  const author({Key? key}) : super(key: key);

  @override
  State<author> createState() => _authorState();
}
void func()
{
  return;
}
void clearController(TextEditingController x)
{
  x.clear();
}
class _authorState extends State<author> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Quotes APP"),
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 40,),
            TextFormField(
              controller: _authorName,
                  decoration: InputDecoration(
                    hintText: '  Enter the AUTHORS Name',
                    hintStyle: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
            ),
            SizedBox(height: 40,),
            ElevatedButton(
                onPressed:() async
              { 
                    currQuote=await Api.getQuotesOneAuthor(_authorName.text.toString());

                    showResult= !showResult;
                    setState(() {
                    });
                    showResult==false?clearController(_authorName):func();
              },
                child: showResult==false?Text('Search'):Text('Undo'),
            ),
            showResult==true?
                Card(
                  margin: EdgeInsets.all(20),
                  color: Color(0XFFeeeeee),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${currQuote?? "Don't talk about what you have done or what you are going to do."}',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(height: 22),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            _authorName.text.toString() ?? "Thomas Jefferson",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                      ),
                      IconButton(

                          onPressed: (){
                            isFav=!isFav;
                            setState(() {

                            });
                          },
                          icon:
                          isFav==true?
                          Icon(
                              Icons.favorite,
                            color: Colors.red,
                          ):
                          Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          ),


                      ),
                    ],
                  ),
                )
                :
                SizedBox(),
          ],
        ),
      ),
    );
  }
}
