import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/services/database_helper.dart';

import '../provider/player_service.dart';

class PlaylistScreen extends StatefulWidget {
  static const routeName = '/playlist-screen';
  const PlaylistScreen({super.key});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0xFF0F0817),
                    Color(0xFF892FE0),
                    Color(0xFFFF0F0817),
                  ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          child: Image.asset(
                            'assets/relaxing.jpeg',
                            height: 300,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                          )),
                      const Positioned(
                        bottom: 30,
                        left: 10,
                        child: Column(
                          children: [
                            Text(
                              'Relaxing Instrumentals',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            Text(
                              'Chill your mind',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFA5A5A5)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: FutureBuilder(
                          future: DatabaseHelper.getAllMusics(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Text('');
                            }
                            if (snapshot.hasError) {
                              return Text('');
                            }
                            return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: (){
                                      Provider.of<AudioPlayerService>(context,listen: false).playMusic(snapshot.data![index].title.replaceFirst('assets/', ''));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.asset(
                                                'assets/song.jpeg',
                                                width: 56,
                                                height: 56,
                                                fit: BoxFit.cover,
                                              )),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            snapshot.data![index].title,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}