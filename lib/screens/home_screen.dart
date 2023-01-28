import 'package:flutter/material.dart';
import 'package:quotes_app/models/quotes.dart';
import 'package:quotes_app/services/api.dart';
import 'dart:developer';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var size, height, width;
  Quotes? data;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Quotes APP"),
        // actions: [
        //   IconButton(
        //     icon: Icon(
        //       Icons.refresh_outlined,
        //     ),
        //     iconSize: 30,
        //     onPressed: () {
        //       getQuotes();
        //     },
        //   ),
        // ],
      ),
      // body: RefreshIndicator(
      //   onRefresh: getQuotes,
      //   child: ListView(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(18.0),
      //         child: Text(
      //           "Pull to Refresh",
      //           textAlign: TextAlign.center,
      //           style: TextStyle(
      //             fontSize: 15,
      //           ),
      //         ),
      //       ),
      //       SizedBox(height: 20),
      //       Container(
      //         padding: EdgeInsets.symmetric(
      //           horizontal: 10,
      //         ),
      //         width: width / 2,
      //         child: Card(
      //           margin: EdgeInsets.only(top: 20),
      //           color: Color(0XFFeeeeee),
      //           shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(10.0),
      //           ),
      //           elevation: 10,
      //           child: Padding(
      //             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 Text(
      //                   '${data?.content ?? "Don't talk about what you have done or what you are going to do."}',
      //                   textAlign: TextAlign.justify,
      //                   style: TextStyle(
      //                     fontSize: 20,
      //                     fontStyle: FontStyle.italic,
      //                   ),
      //                 ),
      //                 SizedBox(height: 22),
      //                 Align(
      //                     alignment: Alignment.bottomRight,
      //                     child: Text(
      //                       data?.author ?? "Thomas Jefferson",
      //                       textAlign: TextAlign.justify,
      //                       style: TextStyle(
      //                         fontSize: 17,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ))
      //               ],
      //             ),
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(


                onPressed:()
               {

                   Navigator.pushNamed(context, 'author');
                },
                child: Text('Author Quote')
            ),
            ElevatedButton(


                onPressed:()
                {
                  Navigator.pushNamed(context, 'search');
                },
                child: Text('Search Quote')

            ),
            ElevatedButton(


                onPressed:()
                {
                  Navigator.pushNamed(context, 'Fav');
                },
                child: Text('Your Favorites')

            ),
          ],
        ),
      ),

    );
  }

  Future<Null> getQuotes() async {
    log('func');
    data = await Api.getQuotes();

    log('jfbkr');
    setState(() {});
  }
}