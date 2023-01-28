import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../services/api.dart';
bool showResult=false;
bool isFav=false;
TextEditingController _topicName= TextEditingController();


List<String>currQuote=[];
List<bool>isIcon=[];
class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}

List<String> list = <String>['10'];
String dropdownValue = list.first;
void func()
{
  return;
}
void clearController(TextEditingController x)
{
  dropdownValue=list.first;
  x.clear();
}
class _searchState extends State<search> {
  @override
  void initState()
  {
    super.initState();
    for(int i=1;i<=100;i++)
    {
      if(i==10)continue;
      list.add(i.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
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
                controller: _topicName,
                decoration: InputDecoration(
                  hintText: '  Enter the Topic you want',
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
              DropdownButtonExample(),
              SizedBox(height: 40,),
              ElevatedButton(
                onPressed:() async
                {
                  currQuote=(await Api.getQuotesLimitTopic(_topicName.text.toString(),dropdownValue));
                  showResult= !showResult;

                  setState(() {
                    for(int i=0;i<currQuote.length;i++)
                      {
                        isIcon.add(false);
                      }
                  });
                  showResult==false?clearController(_topicName):func();
                },
                child: showResult==false?Text('Search'):Text('Undo'),
              ),
              showResult==true?
              SizedBox(
                height: height/2,
                child: ValueListenableBuilder(
                  valueListenable: Hive.box('mibox').listenable(),
                  builder: (context,box,child) {
                    return ListView.separated(
                      itemCount: currQuote.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider();
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(currQuote[index]),
                          trailing: IconButton(
                            onPressed: () async{
                              isIcon[index] = !isIcon[index];
                              if(isIcon[index])
                                {

                                  setState(() {
                                    var x= box.get("currentUser");
                                    x= x+(currQuote[index]);
                                    box.put("currentUser",x);
                                    log(box.get("currentUser".toString()));
                                  });
                                }

                              setState(() {
                              });
                            },

                            icon: isIcon[index] == false ?
                            Icon(Icons.favorite_border,
                              color: Colors.red,
                            ) :
                            Icon(Icons.favorite,
                              color: Colors.red,
                            ),
                          ),
                        );
                      },
                    );
                  }
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


class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {


  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
