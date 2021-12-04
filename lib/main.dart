import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'on_boarding.dart';



void main() {
  runApp(const MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}




class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller ;
  late Animation<double> _animation ;
  bool to = false ;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration:const Duration(seconds: 3) , vsync: this , lowerBound: 0 , upperBound:1  )..repeat(period: const Duration(seconds:3), max: 1,reverse: true );
    _animation = CurvedAnimation(
      parent: _controller ,
      curve:Curves.linear ,
    );
    Future.delayed(const Duration(seconds: 3),(){ if(to == false)setState(() {to = true ;});}) ;
    Future.delayed(const Duration(seconds: 5),(){Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const OnBoardScreen()));}) ;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(

        body:Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizeTransition(
                axis: Axis.horizontal ,
                sizeFactor:  _animation,
                child: Center(child:Image.asset('assets/paint.png',height: 200,width: 200,) ),
              ),

               AnimatedContainer(
                height: to == true? 100 : 0,
                width:  200 ,
                child: Center(child: Text("Ink In Water" , style: GoogleFonts.amiri(

                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                    color: Colors.black
                ),)),
                duration: const Duration(seconds: 5),

              )

            ],
          ),
        )
    );
  }
}




