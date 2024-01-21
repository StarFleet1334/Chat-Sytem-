
import 'package:chatty/common/entities/entities.dart';
import 'package:chatty/pages/frame/signin/state.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


class SignInController extends GetxController {
  SignInController();
  final state = SignInState();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'openid'
    ]
  );

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "phone number") {
        if (kDebugMode) {
          print("...you are logging in with phone number...");
        }
      } else if (type == "google"){
        if (kDebugMode) {
          var user = await _googleSignIn.signIn();
          if (user != null) {
            String? displayName = user.displayName;
            String email = user.email;
            String id = user.id;
            String photoUrl = user.photoUrl??"assets/icons/google.png";
            LoginRequestEntity loginPanelListRequest = LoginRequestEntity();
            loginPanelListRequest.avatar = photoUrl;
            loginPanelListRequest.name = displayName;
            loginPanelListRequest.email = email;
            loginPanelListRequest.open_id = id;
            loginPanelListRequest.type = 2;
          }
        }
      } else {
        if (kDebugMode) {
          print("...Not sure");
        }
      }
    } catch(e) {
      if (kDebugMode) {
        print("...error with login $e");
      }
    }
  }

}