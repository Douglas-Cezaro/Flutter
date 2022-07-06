import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? firebaseUser;
  Map<String, dynamic> userData = {};

  bool isLoading = false;

  void singUp({
    required Map<String, dynamic> userData,
    required String pass,
    required VoidCallback onSuccess,
    required VoidCallback onFail,
  }) {
    isLoading = true;
    notifyListeners();

    _auth
        .createUserWithEmailAndPassword(
            email: userData["email"], password: pass)
        .then((user) async {
      firebaseUser = user.user;
      await _saveUserData(userData);
      isLoading = false;
      onSuccess();
      notifyListeners();
    }).catchError((e) {
      isLoading = false;
      onFail();
      notifyListeners();
    });
  }

  void singIn() async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 3));
    isLoading = false;
    //Notificar o flutter que houver modificações no app e tudo que estiver no ScopedModelDescendant vai ser atualizado
    notifyListeners();
  }

  void recoverPass() {}

  bool isLoggedIn() {
    return firebaseUser != null;
  }

  Future<void> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser?.uid)
        .set(userData);
  }

  void singOut() async {
    await _auth.signOut();
    userData = {};
    firebaseUser = null;
    notifyListeners();
  }
}
