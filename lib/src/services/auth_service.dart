import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  
  void sendVerificationEmail(User? user) async{
    User? user = FirebaseAuth.instance.currentUser;

    if (user!= null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  setNewUserData(String email, String username, PhoneAuthCredential telephone, String birthday){
    User? user = FirebaseAuth.instance.currentUser;

    if (user!= null) {
      FirebaseAuth.instance.currentUser?.updateDisplayName(username);
      FirebaseAuth.instance.currentUser?.updatePhoneNumber(telephone);
    }
  }

  //Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //SignIn
  signIn(AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds);
  }

  signInWithOTP(smsCode, verId) {
    AuthCredential authCreds = PhoneAuthProvider.credential(
        verificationId: verId, smsCode: smsCode);
    signIn(authCreds);
  }
}