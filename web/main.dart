import 'dart:html';

import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;
import 'package:google_maps/google_maps.dart';
//import 'package:firebase/src/assets/assets.dart';

GMap googleMap;

void main() {
 fb.initializeApp(
    apiKey: "AIzaSyDLcSXnz9AWjfCixVxgHqW7fBVdgiRvzH4",
    authDomain: "misasrd-39bbd.firebaseapp.com",
    databaseURL: "https://misasrd-39bbd.firebaseio.com",
    projectId: "misasrd-39bbd",
    storageBucket: "misasrd-39bbd.appspot.com",
    messagingSenderId: "343153881263"
    );

print("inicial el mapa");

  _LoadMap();

print("Final el mapa");


fs.CollectionReference ref = fb.firestore().collection("iglesias");

var ulista = querySelector("#liparroquia");


print(ref.id);

ref.get().then((querySnapshot) {
    querySnapshot.forEach((doc) {
        // doc.data() is never undefined for query doc snapshots
    var spanElement = new SpanElement()..text = doc.data()["nombre"];
    spanElement.appendText(" - ");
    spanElement.appendText(doc.data()["sector"]);

    var aElementLocate = new AnchorElement(href: "#")
      ..text = " Localizar"
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

querySelector('#output').text = 'Your Dart app is running.';
}

_LoadMap(){
 final mapOptions = new MapOptions()
      ..zoom = 8
      ..center = new LatLng(-34.397, 150.644);
  googleMap=  new GMap(document.getElementById('map-canvas'), mapOptions);
  
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

_PlaceMarker(lat,long);
  
}

_PlaceMarker(lat,long){

  googleMap.center= new LatLng(lat, long);
  googleMap.zoom=15;

final marker = new Marker(new MarkerOptions()
    ..map = googleMap
..position = googleMap.center);

}