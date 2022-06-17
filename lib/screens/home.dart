import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}



   


class _HomepageState extends State<Homepage> {

  static final LatLng _kMapCenter =
  LatLng(19.018255973653343, 72.84793849278007);

  static final CameraPosition _kInitialPosition =
  CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);


  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   
    var size = MediaQuery.of(context).size;
    return  Scaffold(
     body: SingleChildScrollView(
       child: Column(
          children  : [Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 150, left: 9),
              child: const Text(
                "Position actuelle : ",
                style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 27, 27, 27),
                fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
                  margin:
                      const EdgeInsets.only(top: 30.0, left: 13.0, right: 13.0),
                  height: size.width,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFE6E6E6), width: 2),
                  ),
      child: Stack(
                    children: [
                      GoogleMap(
                        initialCameraPosition: _kInitialPosition,
                      ),
                    ]     
     ),
       ),
       ]
    )
    ),
    );
  }
}