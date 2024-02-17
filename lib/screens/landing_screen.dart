import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/screens/home_screen.dart';

class LandingScreen extends StatefulWidget {

  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Image.asset('assets/landing.jpeg',

                    fit: BoxFit.fitHeight,),
                ),


              ],
            ),
            Positioned.fill(
              top: MediaQuery.of(context).size.height-240,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Feel the beat',style: GoogleFonts.openSans(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),),
                  const SizedBox(height: 10,),
                  Text('Emmerse yourself into the\n world of music today',
                    textAlign: TextAlign.center,

                    style: GoogleFonts.openSans(
                    fontSize: 14,
                      height: 1,
                      fontWeight: FontWeight.w600,
                    color:const Color(0xFFA5A5A5),
                  ),),
                  const SizedBox(height: 30,),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient:const LinearGradient(
                          colors: [
                            Color(0xFF842ED8),
                            Color(0xFFDB28A9),
                            Color(0xFF9D1DCA),
                          ]
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10,bottom: 10,left: 40,right: 40),
                        child: Text('Continue',style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),),
                      ),
                    ),
                  ),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
