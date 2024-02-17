import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/screens/playlist_screen.dart';

import '../widgets/playlist_widget.dart';

class HomeScreen extends StatefulWidget {
  static const routeName='home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF0F0817),
                      Color(0xFF892FE0),
                      Color(0xFFFF0F0817),
                    ]
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome back!',style: GoogleFonts.openSans(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),),

                      Text('What do you feel like today?',style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFA5A5A5),
                      ),),
                      const SizedBox(height: 20,),
                      Container(
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF433E48),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Image.asset('assets/search_icon.png') ,
                              const SizedBox(width: 10,),
                              Text('Search song, playslist, artist...',style: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFA5A5A5),
                              ),)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      DefaultTabController(length: 1, child: SizedBox(
                        height: 500,
                        width: 400,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           TabBar(
                            dividerColor: Colors.transparent,
                               unselectedLabelColor: Colors.transparent,

                               tabs: [
                             Text('Recent',style: TextStyle(color: Colors.white),),
                             Text('Top 50',style: TextStyle(color: Color(0xFFA5A5A5)),),
                             Text('Chill',style: TextStyle(color: Color(0xFFA5A5A5)),),
                             Text('R & B',style: TextStyle(color: Color(0xFFA5A5A5)),),

                           ]),
                            SizedBox(
                              height: 300,
                              width: MediaQuery.of(context).size.width-40,
                              child: TabBarView(
                                  children: [

                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: SizedBox(
                                    height: 300,
                                    width: MediaQuery.of(context).size.width-40,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        InkWell(
                                          onTap:(){
                                            Navigator.of(context).pushNamed(PlaylistScreen.routeName,arguments: {

                                            });
                                          },
                                            child: PlaylistWidget(name: 'Relaxing Instrumentals',)),
                                        InkWell(
                                          onTap: (){
                                            Navigator.of(context).pushNamed(PlaylistScreen.routeName,arguments: {

                                            });
                                          },
                                            child: PlaylistWidget(name: 'Today Hit',)),
                                        InkWell(
                                          onTap: (){
                                            Navigator.of(context).pushNamed(PlaylistScreen.routeName,arguments: {

                                            });
                                          },

                                            child: PlaylistWidget(name: 'Workout Energy',)),
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                            )
                          ],

                        ),
                      ),

                      )
                    ],
                  ),
                ),
              
              ),
            ),
          ],
        ),
      ),
    );
  }
}
