import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
class favorite extends StatefulWidget {
  const favorite({Key? key}) : super(key: key);

  @override
  State<favorite> createState() => _favoriteState();
}

class _favoriteState extends State<favorite> {
  @override
  void initState()
  {
    super.initState();

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
        body: SizedBox(
          height: height/1.5,
          child: ValueListenableBuilder(
              valueListenable: Hive.box('mibox').listenable(),
              builder: (context,box,child) {
                var x= box.get("currentUser");
                List<String>currQuote=x.split(".");
                return ListView.separated(

                  itemCount: currQuote.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(currQuote[index]),
                      trailing: IconButton(
                        onPressed: () {

                          },
                       icon:
                        Icon(Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    );
                  },
                );
              }
          ),
        ),
    );
  }
}
