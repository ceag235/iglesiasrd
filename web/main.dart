import 'dart:html';

import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;
//import 'package:firebase/src/assets/assets.dart';


void main() {
  fb.initializeApp(
    apiKey: "AIzaSyDLcSXnz9AWjfCixVxgHqW7fBVdgiRvzH4",
    authDomain: "misasrd-39bbd.firebaseapp.com",
    databaseURL: "https://misasrd-39bbd.firebaseio.com",
    projectId: "misasrd-39bbd",
    storageBucket: "misasrd-39bbd.appspot.com",
    messagingSenderId: "343153881263"
    );

  //fs.Firestore firestore = firestore();
  fs.CollectionReference ref = fb.firestore().collection("iglesias");

var ulista = querySelector("#liparroquia");


print(ref.id);

var map;

ref.get().then((querySnapshot) {
    querySnapshot.forEach((doc) {
        // doc.data() is never undefined for query doc snapshots
      var spanElement = new SpanElement()..text = doc.data()["nombre"];
     
      var element = new LIElement()
      ..id = "item-${doc.id}"
      ..append(spanElement);
    ulista.append(element);
      
    });
});

print(map);

print("hola");

  querySelector('#output').text = 'Your Dart app is running.';
}
