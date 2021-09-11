import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ayuvani/models/UserResults.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';

class SocialLogin {
  FirebaseAuth auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<UserCredential> googleSignin() async {
    try {
      GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      final results = await auth.signInWithCredential(credential);

      return results;
    } catch (error) {
      print(error);
    }
  }

  //-----------------------------

  Future<UserResults> fbLogin({BuildContext context}) async {
    final facebookLogin = FacebookLogin();
    final facebookLoginResult =
        await facebookLogin.logIn(['email', 'public_profile']);
    var profile, token;
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        print("Error apps " + facebookLoginResult.errorMessage);
        break;
      case FacebookLoginStatus.loggedIn:
        token = facebookLoginResult.accessToken.token;
        print("token" + token);
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.width(100).height(100)&access_token=$token');
        if (graphResponse.statusCode == 200) {
          profile = json.decode(graphResponse.body);
          print("profile" + profile.toString());
        } else {
          toast("Something went Wrong");
          print("Error");
        }
        break;
    }
    var results = UserResults(token: token, profile: profile);
    return results;
  }
}
