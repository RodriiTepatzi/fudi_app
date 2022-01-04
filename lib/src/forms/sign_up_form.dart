import 'package:flutter/material.dart';
import 'package:fudi_app/src/services/extensions.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/widgets/alert_dialog.dart';

// Define a custom Form widget.
class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class SignUpFormState extends State<SignUpForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
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
            validator: (input) => input.toString().isValidEmail() ? null : "Email no valido.",
            keyboardType: TextInputType.emailAddress,
            cursorColor: accentColorApp,

            decoration: const InputDecoration(
              fillColor: textFieldColorApp,
              hintText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: (){
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                Navigator.pushNamed(context, 'login');
                showAlertDialog(context, Icons.mark_email_read,
                'Email enviado', 
                'El correo de recuperación ha sido enviado. Revise su bandeja de entrada o su carpeta de \'spam\'.', 
                'Aceptar');
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              primary: accentColorApp,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Recuperar contraseña',
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