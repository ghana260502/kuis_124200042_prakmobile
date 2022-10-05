import 'package:flutter/material.dart';
import 'package:kuis_124200042/groceries.dart';
import 'package:kuis_124200042/view_page.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black26.withOpacity(0.8),
        appBar: AppBar(
          title: Text('List Groceries'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final Groceries groceries = groceryList[index];
            double rating;

            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewPage(
                          groceries: groceries,
                        )));
              },
              child: Card(
                elevation: 50,
                shadowColor: Colors.purple,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 100,
                      // width: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.deepPurpleAccent,
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          colorFilter: ColorFilter.mode(
                              Colors.green.withOpacity(0.6), BlendMode.dstOut),
                          image: NetworkImage(groceries. productImageUrls[0]),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            groceries.name,
                            style: TextStyle(
                              // backgroundColor: Colors.deepPurpleAccent,
                                color: Colors.black,
                                shadows: [
                                  Shadow(
                                      color: Colors.white,
                                      blurRadius: 10,
                                      offset: Offset(2, 2))
                                ],
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            groceries.storeName,
                            style: TextStyle(
                              // backgroundColor: Colors.deepPurpleAccent,
                                color: Colors.black,
                                shadows: [
                                  Shadow(
                                      color: Colors.white,
                                      blurRadius: 10,
                                      offset: Offset(2, 2))
                                ],
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Rating : ${groceries.reviewAverage}',
                            style: TextStyle(shadows: [
                              Shadow(
                                  color: Colors.white,
                                  blurRadius: 10,
                                  offset: Offset(2, 2))
                            ], fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            groceries.price,
                            style: TextStyle(shadows: [
                              Shadow(
                                  color: Colors.white,
                                  blurRadius: 10,
                                  offset: Offset(2, 2))
                            ], fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: groceryList.length,
        ));
  }
}
