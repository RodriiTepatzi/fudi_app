import 'package:flutter/material.dart';
import 'package:fudi_app/src/services/extensions.dart';
import 'package:fudi_app/src/services/validations.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/widget_properties.dart';
import 'package:fudi_app/src/widgets/alert_dialog.dart';

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
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (input) => Validations().validateUsername(input.toString()),
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
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.

                // IF something happens then log in
                Navigator.pushNamed(context, 'tabs');
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(roundedCornersValue),
              ),
              primary: accentColorApp,
              minimumSize: Size(double.infinity, heightFormFieldValue),
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