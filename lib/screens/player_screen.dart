import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/player_service.dart';

class PlayerScreen extends StatefulWidget {
  static const String routeName = '/player-screen';

  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  double _currentValue = 0.0;
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AudioPlayerService>(
          builder: (context, playerService, child) {
        return Scaffold(
          body: Container(
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ))),
                const SizedBox(
                  height: 20,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/song.jpeg',
                      height: 342,
                      width: MediaQuery.of(context).size.width - 40,
                      fit: BoxFit.cover,
                    )),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           SizedBox(
                             width:MediaQuery.of(context).size.width-70,
                             child: Text(
                              playerService.songName,
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                  color: Colors.white),
                                                       ),
                           ),
                          Icon(
                            Icons.bookmark,
                            color: Colors.white,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Slider(
                        value: _currentValue,
                        min: 0,
                        max: 100,
                        onChanged: (value) {
                          setState(() {
                            _currentValue = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/back.png'),
                            Container(
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(colors: [
                                    Color(0xFF892FE0),
                                    Colors.pink
                                  ])),
                              child: !playerService.isPlaying
                                  ? InkWell(
                                      onTap: () {
                                        playerService.playMusic(playerService.songName);

                                      },
                                      child: const Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        playerService.pause();
                                      },
                                      child: const Icon(
                                        Icons.pause,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                    ),
                            ),
                            Image.asset('assets/forward.png'),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
