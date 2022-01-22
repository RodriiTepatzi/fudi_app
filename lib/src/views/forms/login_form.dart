import 'package:flutter/material.dart';
import 'package:fudi_app/src/services/extensions.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/widget_properties.dart';
import 'package:fudi_app/src/widgets/alert_dialog.dart';

// Define a custom Form widget.
class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
  
}

class LoginFormState extends State<LoginForm> {
  
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (input) => input.toString().isEmpty ? "Campo vacio" : null,
            keyboardType: TextInputType.emailAddress,
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
            controller: _passwordController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (input) => input.toString().isEmpty ? "Campo vacio" : null,
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
                String email = _emailController.text;
                String password = _passwordController.text;
                

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