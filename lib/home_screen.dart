import 'package:CattleSavior/screens/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:CattleSavior/screens/Grooming_screen.dart';
import 'package:CattleSavior/screens/List_Diseases_Screen.dart';
import 'package:CattleSavior/screens/Nearby_hospitals.dart';
import 'package:CattleSavior/screens/Vaccination_Screen.dart';
import 'package:CattleSavior/screens/Vaccination_reminder.dart';
import 'package:CattleSavior/screens/current_location_screen.dart';
import 'package:CattleSavior/screens/medicine_screen.dart';
import 'package:CattleSavior/screens/nearby_places_screen.dart';
import 'package:CattleSavior/screens/search_places_screen.dart';
import 'package:CattleSavior/TfliteModel.dart';

import 'screens/polyline_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CATTLE SAVIOR"),
        centerTitle: true,
      ),

      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return const TfliteModel();
              }));
            }, child: const Text("রোগ নির্ণয় ও করণীয়",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),textAlign: TextAlign.justify,)),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return const CurrentLocationScreen();
              }));
            }, child: const Text("নিকটতম পশুচিকিৎসা হাসপাতাল",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),textAlign: TextAlign.justify,)),

            // ElevatedButton(onPressed: (){
            //   Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
            //     return const SearchPlacesScreen();
            //   }));
            // }, child: const Text("Search Places")),


            // ElevatedButton(onPressed: (){
            //   Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
            //     return const NearByPlacesScreen();
            //   }));
            // }, child: const Text("নিকটতম পশুচিকিৎসা হাসপাতাল",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.justify,)),
            //

            // ElevatedButton(onPressed: (){
            //   Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
            //     return const PolylineScreen();
            //   }));
            // }, child: const Text("Polyline between 2 points")),

            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return const List_Diseases();
              }));
            }, child: const Text("গবাদি পশুর সাধারণ রোগের তালিকা",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),textAlign: TextAlign.justify,)),


            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return const List_Vaccination_Diseases();
              }));
            }, child: const Text("ভ্যাকসিন সম্পর্কে জানুন",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),)),
            // ElevatedButton(onPressed: (){
            //   Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
            //     return NearbyHospitals();
            //   }));
            // }, child: const Text("Nearby",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),)),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return Vaccine_reminder(title: "Vaccine Reminder");
              }));
            }, child: const Text("ভ্যাকসিন রিমাইন্ডার",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),)),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return cattle_grooming();
              }));
            }, child: const Text("সার্বিক পরিচর্যা",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),)),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return medicine();
              }));
            }, child: const Text("ঔষধ পরিচিতি",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),)),

            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return Weather();
              }));
            }, child: const Text("আবহাওয়া",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),)),

          ],


        ),
      ),
    );
  }
}
