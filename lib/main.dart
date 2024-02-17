import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/models/music_model.dart';
import 'package:untitled2/provider/player_service.dart';
import 'package:untitled2/screens/home_screen.dart';
import 'package:untitled2/screens/landing_screen.dart';
import 'package:untitled2/screens/player_screen.dart';
import 'package:untitled2/screens/playlist_screen.dart';
import 'package:untitled2/services/database_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await loadFromDb();

  runApp(const MyApp());
}
loadFromDb() async{
  final assetManifest=await AssetManifest.loadFromAssetBundle(rootBundle);
  final musicAssetList=assetManifest.listAssets().where((element) => element.startsWith('assets/Today_Hit')).toList();
  print(musicAssetList);
  musicAssetList.forEach((element) async {
    final Music music=Music(isFavorite: 0, type: 'Today Hit', title: element);
    try{
      await DatabaseHelper.addMusicToDb(music);
    }catch(e){
      print('error adding to db $e');

    }
  });

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AudioPlayerService>(create: (_)=>AudioPlayerService())
      ],
      child: MaterialApp(
       routes: {
         PlaylistScreen.routeName:(_)=>const PlaylistScreen(),
         HomeScreen.routeName:(_)=>const HomeScreen(),
         PlayerScreen.routeName:(_)=>const PlayerScreen(),
       },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: LandingScreen(),
      ),
    );
  }
}

