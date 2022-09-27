import 'package:app_test/repository/base_auth_repository.dart';
import 'package:app_test/screens/ResultScreen/view/result_screen.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthRepository extends BaseAuthRepository {
  final auth.FirebaseAuth _firebaseAuth;

  AuthRepository({auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  @override
  Future<auth.User?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      final user = credential.user;
      Get.to(() => const ResultScreen(result: true));
      return user;
    } catch (_) {
      Get.to(() => const ResultScreen(result: false));
    }
  }

  @override
  // TODO: implement user
  Stream<auth.User?> get user => _firebaseAuth.userChanges();

  @override
  Future logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.to(() => const ResultScreen(result: true));

    } catch (e) {
      Get.to(() => const ResultScreen(result: false));
    }
  }
}
