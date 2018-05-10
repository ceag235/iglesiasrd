import 'dart:html';

import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;
import 'package:google_maps/google_maps.dart';
//import 'package:firebase/src/assets/assets.dart';


void main() {
 /* fb.initializeApp(
    apiKey: "AIzaSyDLcSXnz9AWjfCixVxgHqW7fBVdgiRvzH4",
    authDomain: "misasrd-39bbd.firebaseapp.com",
    databaseURL: "https://misasrd-39bbd.firebaseio.com",
    projectId: "misasrd-39bbd",
    storageBucket: "misasrd-39bbd.appspot.com",
    messagingSenderId: "343153881263"
    );*/

  //_LoadMap();
/*
  //fs.Firestore firestore = firestore();
  fs.CollectionReference ref = fb.firestore().collection("iglesias");

var ulista = querySelector("#liparroquia");


print(ref.id);

var map;

ref.get().then((querySnapshot) {
    querySnapshot.forEach((doc) {
        // doc.data() is never undefined for query doc snapshots
    var spanElement = new SpanElement()..text = doc.data()["nombre"];
    spanElement.appendText("-");
    spanElement.appendText(doc.data()["sector"]);

    var aElementLocate = new AnchorElement(href: "#")
      ..text = "Localizar"
      ..onClick.listen((e) {
        e.preventDefault();
        _ShowOnMap(doc.data()["latlong"]);
     });


    var element = new LIElement()
      ..id = "item-${doc.id}"
      ..append(spanElement)
      ..append(aElementLocate);
      ulista.append(element);
    });
});

print(map);

print("hola");*/

print("inicial el mapa");
  final mapOptions = new MapOptions()
      ..zoom = 8
      ..center = new LatLng(-34.397, 150.644);
    new GMap(document.getElementById('map-canvas'), mapOptions);
  
    print("ya acabo del mapa");

  querySelector('#output').text = 'Your Dart app is running.';
}

_LoadMap(){
 

}


_ShowOnMap(latlong){

var lat = 0;
var long = 0;

for (var key in latlong.keys){
  if (key == 'lat')lat= latlong[key];
  if (key == 'long')long = latlong[key];
}

print(latlong);
print(lat);
print(long);
  
}