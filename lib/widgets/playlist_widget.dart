import 'package:flutter/material.dart';
class PlaylistWidget extends StatelessWidget {
  final String name;
  const PlaylistWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:BorderRadius.circular(20),
            child: Image.asset('assets/relaxing.jpeg',height: 202,width: 190,
              fit: BoxFit.cover,),),
          const SizedBox(height: 10,),
          Text('$name',style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.white,
          ),),
          Text('Chill Your Mind',style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Color(0xFFA5A5A5),
          ),)
        ],
      ),
    );
  }
}
