import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  void signIn(String email, String password, context) async {
    try {
      final _user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (_user != null) {
        Navigator.pushNamed(context, '/home');
      }
    } catch (e) {
      Exception(e);
    }
  }

  void signUp(String email, String password, context) async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _firestore.collection('users').add({
        'uid': _auth.currentUser!.uid,
        'email': _auth.currentUser!.emailVerified
      });
      if (newUser != null) {
        Navigator.pushNamed(context, '/login');
      }
    } catch (e) {
      Exception(e);
    }
  }
}
