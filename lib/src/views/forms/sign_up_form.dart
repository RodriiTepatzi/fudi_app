import 'package:flutter/material.dart';
import 'package:fudi_app/src/services/validations.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/widget_properties.dart';
import 'package:fudi_app/src/services/extensions.dart';
import 'package:fudi_app/src/services/auth_service.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
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
  String errorMessage = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    errorMessage = "";
    TextEditingController usernameController = TextEditingController();
    TextEditingController fullnameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    String flag = "";
    String telephone = "";
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
            validator: (input) => Validations().validateUsername(input.toString()),
            controller: fullnameController,
            keyboardType: TextInputType.text,
            cursorColor: accentColorApp,
            decoration: const InputDecoration(
              filled: true,
              fillColor: textFieldColorApp,
              hintText: 'Nombre completo',
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
            validator: (input){
              if(input != null)  {
                if(!input.toString().isValidEmail()){
                  "Formato no valido.";
                }
              }
            },
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
          /*IntlPhoneField(
            onSaved: (phone){
              setState(() {
                  telephone = phone.completeNumber;
              });
            },
            searchText: "Busque un país o por código",
            decoration: const InputDecoration(
                labelText: 'Número de telefono',
                border: OutlineInputBorder(
                    borderSide: BorderSide(),
                ),
            ),
            initialCountryCode: 'MX',
            onChanged: (phone) {
                setState(() {
                  telephone = phone.completeNumber;
                });
            },
          ),*/
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
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context, //context of current state
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2101)
              );

              if(pickedDate != null ){
                  print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(formattedDate); //formatted date output using intl package =>  2021-03-16
              }else{
                  print("Date is not selected");
              }
            },
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
          Container(
            padding: const EdgeInsets.all(marginWidget),
            child: Text(
              errorMessage,
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: (){
              if (_formKey.currentState!.validate()){
                setState(() {
                  (AuthService().createNewUser(
                    context,
                    emailController.text, 
                    fullnameController.text,
                    usernameController.text, 
                    telephoneController.text, 
                    DateTime.now(),
                    passwordController.text,
                  )
                  ).then(
                    (value) => errorMessage = value.toString()
                  );
                });
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
                  'Crear cuenta',
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