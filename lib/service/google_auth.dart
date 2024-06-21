import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignInProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: ['email', 'https://www.googleapis.com/auth/youtube.readonly'],
    // clientId:
    //     '826217552364-f7siooo9c9913660bht1im7ktlfhh732.apps.googleusercontent.com',
  );

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return null; // User canceled the sign-in
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        // Fetch YouTube details
        final youtubeData = await fetchYoutubeData(googleAuth.accessToken);
        print(youtubeData);
      }

      return user;
    } catch (e) {
      print('Error during Google sign-in: $e');
      return null;
    }
  }

  Map<String, dynamic>? datas;
  Future<Map<String, dynamic>> fetchYoutubeData(String? accessToken) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://www.googleapis.com/youtube/v3/channels?part=snippet,statistics&mine=true'),
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        datas = json.decode(response.body);
        notifyListeners();
      } else {
        throw Exception(
            'Failed to load YouTube data: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error fetching YouTube data: $e');
      throw Exception('Failed to load YouTube data');
    }
    return datas!;
  }

  Future<void> signOutGoogle() async {
    try {
      await googleSignIn.signOut();
      await _auth.signOut();
    } catch (e) {
      print('Error signing out: $e');
    }
  }
}
