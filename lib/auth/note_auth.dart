import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class NoteAuth {
  final _firestore = FirebaseFirestore.instance;
  final _currentUid = FirebaseAuth.instance.currentUser!.uid;
  final _collection = FirebaseFirestore.instance.collection("notes");

  void addNote(String title, String note, String uid, context) async {
    try {
      await _firestore.collection('notes').add({
        'title': title,
        'note': note,
        'uid': uid,
      });

      Navigator.pop(context);
    } catch (e) {
      print(e);
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getNotes() {
    var notes = _collection.where("uid", isEqualTo: _currentUid).snapshots();
    return notes;
  }
}
