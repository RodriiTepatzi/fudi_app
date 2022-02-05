import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fudi_app/src/services/validations.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/widget_properties.dart';
import 'package:fudi_app/src/services/auth_service.dart';

// Define a custom Form widget.
class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

class SignUpFormState extends State<SignUpForm> {
  
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController telephoneController = TextEditingController();
    TextEditingController birthdayController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (input) => Validations().validateUsername(input.toString()),
            controller: usernameController,
            keyboardType: TextInputType.text,
            cursorColor: accentColorApp,
            decoration: const InputDecoration(
              filled: true,
              fillColor: textFieldColorApp,
              hintText: 'Nombre de usuario',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(roundedCornersValue),
                ),
              ),
            ),
          ),
          const SizedBox(height: formFieldHeightGap,),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            //validator: (input) => Validations().validateUsername(input.toString()),
            controller: emailController,
            keyboardType: TextInputType.text,
            cursorColor: accentColorApp,
            decoration: const InputDecoration(
              filled: true,
              fillColor: textFieldColorApp,
              hintText: 'Email',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(roundedCornersValue),
                ),
              ),
            ),
          ),
          const SizedBox(height: formFieldHeightGap,),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            //validator: (input) => Validations().validateUsername(input.toString()),
            keyboardType: TextInputType.phone,
            cursorColor: accentColorApp,
            controller: telephoneController,
            decoration: const InputDecoration(
              filled: true,
              fillColor: textFieldColorApp,
              hintText: 'Número de telefono',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(roundedCornersValue),
                ),
              ),
            ),
          ),
          const SizedBox(height: formFieldHeightGap,),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            //validator: (input) => Validations().validateUsername(input.toString()),
            keyboardType: TextInputType.datetime,
            cursorColor: accentColorApp,
            decoration: const InputDecoration(
              filled: true,
              fillColor: textFieldColorApp,
              hintText: 'Fecha de nacimiento',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(roundedCornersValue),
                ),
              ),
            ),
          ),
          const SizedBox(height: formFieldHeightGap,),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (input) => Validations().validateUsername(input.toString()),
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            controller: passwordController,
            cursorColor: accentColorApp,
            decoration: const InputDecoration(
              filled: true,
              fillColor: textFieldColorApp,
              hintText: 'Contraseña',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(roundedCornersValue),
                ),
              ),
            ),
          ),
          const SizedBox(height: formFieldHeightGap),
          ElevatedButton(
            onPressed: (){
              if (_formKey.currentState!.validate()){
                FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: telephoneController.text,
                  verificationCompleted: (PhoneAuthCredential credential) {
                    FirebaseAuth.instance.currentUser?.updatePhoneNumber(credential);
                  },
                  verificationFailed: (FirebaseAuthException e) {},
                  codeSent: (String verificationId, int? resendToken) {},
                  codeAutoRetrievalTimeout: (String verificationId) {},
                );
                FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                
                
                Navigator.pushNamed(context, 'tabs');
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(roundedCornersValue),
              ),
              primary: accentColorApp,
              minimumSize: const Size(double.infinity, heightFormFieldValue),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Iniciar sesión',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}