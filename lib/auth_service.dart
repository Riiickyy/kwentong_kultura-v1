import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

ValueNotifier<AuthService> authService = ValueNotifier(AuthService());

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  // ✅ LOGIN
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    UserCredential userCred = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    // ✅ Check if user doc exists, if not create it
    DocumentReference userDoc = firestore
        .collection('users')
        .doc(userCred.user!.uid);

    DocumentSnapshot snapshot = await userDoc.get();
    if (!snapshot.exists) {
      await userDoc.set({
        'email': email,
        'name': userCred.user!.displayName ?? '', // fallback if no name
        'createdAt': FieldValue.serverTimestamp(),
      });
    }

    return userCred;
  }

  // ✅ REGISTER (create new user)
  Future<UserCredential> createAccount({
    required String email,
    required String password,
    required String name,
  }) async {
    UserCredential userCred = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await userCred.user!.updateDisplayName(name);

    await firestore.collection('users').doc(userCred.user!.uid).set({
      'name': name,
      'email': email,
      'createdAt': FieldValue.serverTimestamp(),
    });

    return userCred;
  }

  // ✅ SIGN OUT
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  // ✅ RESET PASSWORD with old password
  Future<void> resetPasswordFromCurrentPassword({
    required String currentPassword,
    required String newPassword,
    required String email,
  }) async {
    AuthCredential credential = EmailAuthProvider.credential(
      email: email,
      password: currentPassword,
    );
    await currentUser!.reauthenticateWithCredential(credential);
    await currentUser!.updatePassword(newPassword);
  }

  // ✅ RESET PASSWORD just by email
  Future<void> resetPassword({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  // ✅ RESET PASSWORD + Check Firestore first
  Future<void> resetPasswordWithCheck({required String email}) async {
    final query =
        await firestore
            .collection('users')
            .where('email', isEqualTo: email)
            .get();

    if (query.docs.isEmpty) {
      throw FirebaseAuthException(
        code: 'user-not-found',
        message: 'No account found for this email.',
      );
    }

    await firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
