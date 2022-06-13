import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FormModel extends ChangeNotifier {
  List actions = [];
  List supply1 = [];
  List supply2 = [];
  List supplyAll = [];

  void cardDialog(title, status) {
    actions.add({"title": title, "status": status});
    notifyListeners();
  }

  void clearr() {
    supplyAll.clear();
    notifyListeners();
  }

  void addSupply1(
      choice, property, type, city, locality, society, date, amenities) {
    supply1.add({
      "choice": choice,
      "property": property,
      "type": type,
      "city": city,
      "locality": locality,
      "society": society,
      "date": date,
      "amenities": amenities
    });
    notifyListeners();
  }

  void addSupply2(
      images, layout, washroom, balcony, carpet, floor, rent, security) {
    supply2.add({
      "images": images,
      "layout": layout,
      "washroom": washroom,
      "balcony": balcony,
      "carpet": carpet,
      "floor": floor,
      "rent": rent,
      "security": security
    });
    notifyListeners();
  }

  void addAllSupply(
      text,
      unit,
      name,
      contact,
      choice,
      property,
      type,
      city,
      locality,
      society,
      date,
      amenities,
      images,
      layout,
      washroom,
      balcony,
      carpet,
      floor,
      rent,
      security) {
    supplyAll.add({
      "text": text,
      "unit": unit,
      "name": name,
      "contact": contact,
      "choice": choice,
      "property": property,
      "type": type,
      "city": city,
      "locality": locality,
      "society": society,
      "date": date,
      "amenities": amenities,
      "images": images,
      "layout": layout,
      "washroom": washroom,
      "balcony": balcony,
      "carpet": carpet,
      "floor": floor,
      "rent": rent,
      "security": security
    });
    FirebaseFirestore.instance
        .collection('information')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('propertiesAll')
        .add({
      "properties": supplyAll,
    });
    supply1.clear();
    supply2.clear();
    notifyListeners();
  }
}
