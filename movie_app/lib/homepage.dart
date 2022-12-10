import 'package:flutter/material.dart';
import 'package:movie_app/viewmodel/fetchmovies.dart';

import 'models/movies_models.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Movies data;

  void initState() {
    super.initState();
    ambilData().then((value) {
      setState(() {
        data = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // Text(
            //   'Welcome, ${widget.nama}',
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // ),
            Text(
              "Katalog Movie",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: data.results!.length,
                  itemBuilder: (context, index) {
                    final String genre =
                        data.results![index].genreIds.toString();
                    final String sinopsis =
                        data.results![index].overview.toString();
                    final String rate =
                        data.results![index].voteAverage.toString();
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              spreadRadius: 0,
                              blurRadius: 0,
                              offset:
                                  Offset(0, 10), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 100,
                                  width: 84,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w300${data.results![index].posterPath!}'),
                                      // image:
                                      //     AssetImage('images/jotarotpose.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      data.results![index].title!,
                                      // 'judul',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: 10),
                                      Icon(
                                        Icons.star,
                                        size: 20,
                                        color: Colors.orange,
                                      ),
                                      SizedBox(width: 2),
                                      SizedBox(width: 2),
                                      Text(
                                        rate,
                                        // 'tipe',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(width: 10),
                                      Icon(
                                        Icons.calendar_month_outlined,
                                        size: 20,
                                      ),
                                      SizedBox(width: 2),
                                      SizedBox(width: 10),
                                      Text(
                                        genre,
                                        // 'judul',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // Text(
                                      //   data[index].season,
                                      //   style: TextStyle(fontSize: 14),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
      // child: ListView.builder(
      //   itemCount: data.results!.length,
      //   itemBuilder: (context, index) {
      //     return Column(
      //       children: [
      //         Card(
      //           elevation: 5,
      //           child: Padding(
      //             padding: EdgeInsets.all(32.0),
      //             child: Stack(children: <Widget>[
      //               Align(
      //                 alignment: Alignment.centerRight,
      //                 child: Stack(
      //                   children: <Widget>[
      //                     Padding(
      //                         padding:
      //                             const EdgeInsets.only(left: 24, top: 10),
      //                         child: Column(
      //                           children: <Widget>[
      //                             Row(
      //                               children: <Widget>[
      //                                 SizedBox(
      //                                   height: 80,
      //                                 ),
      //                                 SizedBox(
      //                                   width: 20,
      //                                 )
      //                               ],
      //                             ),
      //                           ],
      //                         ))
      //                   ],
      //                 ),
      //               )
      //             ]),
      //           ),
      //card list view
      // child:
      // ListTile(
      //   title: Text(data.results![index].title!),
      //   subtitle: Text(data.results![index].overview!),
      //   leading: Image.network(
      //       "https://images.unsplash.com/photo-1574375927938-d5a98e8ffe85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bmV0ZmxpeHxlbnwwfHwwfHw%3D&w=1000&q=80"),
      //   // data.results![index].backdropPath!
      // ),
      //       ),
      //     ],
      //   );
      // },
      // ),
      // ),
    );
  }
}
