import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class Auth extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;

  // void initialize() {
  //   if (auth.currentUser != null) {
  //     this.user = auth.currentUser;
  //     print(auth.currentUser);
  //     print("user: " + this.user.toString());
  //   } else {}

  //   notifyListeners();
  // }

  void logout() async {
    try {
      await auth.signOut().then((value) => this.user = auth.currentUser);
    } catch (e) {
      print(e);
    }
    print(user);
    notifyListeners();
  }

  Future<String?> login(String email, String password) async {
    try {
      User? use = await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((user) {
        return user.user;
      });
      if (use != null) {
        print("Login Suceffull!");
        this.user = use;
      } else {
        print("Acount Criation Failed!");
      }
    } on FirebaseAuthException catch (error) {
      print(error.code);
      print(error.message);
      return error.code;
    }
    notifyListeners();
  }

  void createAcount(String nome, String email, String password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => auth.currentUser!.updateDisplayName(nome))
          .then((value) => this.user = auth.currentUser);
    } catch (error) {
      print(error);
    }
  }

  Future<void> changeEmail(String newEmail) async {
    await auth.currentUser!.updateEmail(newEmail);
    this.user = auth.currentUser;
    notifyListeners();
  }

  Future<void> changePassword(String newPassword) async {
    // await auth.currentUser!.updatePassword(newPassword);
    // this.user = auth.currentUser;
    auth.sendPasswordResetEmail(email: auth.currentUser!.email!);
    notifyListeners();
  }

  Future<void> changePhoto(String newPhotoURL) async {
    await auth.currentUser!.updatePhotoURL(newPhotoURL);
    notifyListeners();
  }

  Future<void> changeName(String newName) async {
    await auth.currentUser!.updateDisplayName(newName);
    this.user = auth.currentUser;
    notifyListeners();
  }

  get username {
    return auth.currentUser!.displayName;
  }

  void delete() async {
    await auth.currentUser!
        .delete()
        .then((value) => this.user = auth.currentUser);
  }
}
