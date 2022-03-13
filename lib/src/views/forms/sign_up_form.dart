import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fudi_app/src/controllers/sign_up_controller.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/widget_properties.dart';
import 'package:fudi_app/src/services/auth_service.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:date_field/date_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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
    initializeDateFormatting("es_MX");
    errorMessage = "x";
    super.initState();
  }

  void setMessage(String message){
    setState(() {
      errorMessage = message.toString();  
    });
  }

  @override
  Widget build(BuildContext context) {
    final maskFormatter = MaskTextInputFormatter(
      mask: ' ###-###-####', 
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
    );
    SignUpController _signUpController = SignUpController();
    TextEditingController usernameController = TextEditingController();
    TextEditingController fullnameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController telephoneController = TextEditingController();
    TextEditingController birthdayController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    String _countryCode = "";
    String _telephone = "";
    DateTime birthday = DateTime.now();

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            onSaved: (value) => "xd",
            autovalidateMode: AutovalidateMode.always,
            validator: (input) => _signUpController.validateUsername(input.toString()),
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
            validator: (input) => _signUpController.validateFullname(input.toString()),
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
            validator: (input) => _signUpController.validateEmail(input.toString()),
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
          const SizedBox(height: formFieldHeightGap),
          IntlPhoneField(
            inputFormatters: [
              maskFormatter,
            ],
            controller: telephoneController,
            keyboardType: TextInputType.phone,
            autoValidate: false,
            dropDownArrowColor: accentColorApp,
            countryCodeTextColor: accentColorApp,
            searchText: "Busqueda por país",
            decoration: const InputDecoration(
              labelText: 'Número de telefono',
              filled: true,
              fillColor: textFieldColorApp,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(roundedCornersValue),
                ),
              ),
            ),
            initialCountryCode: 'MX',
            onChanged: (phone) {
              _countryCode = phone.countryCode;
              maskFormatter.updateMask(mask: ' ###-###-####');
            },
          ),
          const SizedBox(height: formFieldHeightGap,),
          DateTimeFormField(
            dateFormat: DateFormat.yMMMMd('es_MX'),
            decoration: const InputDecoration(
              filled: true,
              fillColor: textFieldColorApp,
              hintStyle: TextStyle(
                color: accentColorApp
              ),
              errorStyle: TextStyle(
                color: accentColorApp
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(roundedCornersValue),
                ),
              ),
              suffixIcon: Icon(Icons.event_note),
              labelText: 'Fecha de nacimiento',
            ),
            lastDate: DateTime.now().subtract(const Duration(days: 4745)),
            mode: DateTimeFieldPickerMode.date,
            autovalidateMode: AutovalidateMode.always,
            onDateSelected: (DateTime value) {
              birthday = value;
            },
          ),
          const SizedBox(height: formFieldHeightGap,),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            //validator: (input) => Validations().validateUsername(input.toString()),
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
            onPressed: () async {
              if (_formKey.currentState!.validate()){
                if(usernameController.text.isNotEmpty 
                    /*&& fullnameController.text.isNotEmpty 
                    && emailController.text.isNotEmpty 
                    && telephoneController.text.isNotEmpty
                    && birthdayController.text.isNotEmpty
                    && passwordController.text.isNotEmpty*/){
                  String? message = await _signUpController.validateUserBeforeCreating(context,
                      emailController.text, 
                      fullnameController.text,
                      usernameController.text, 
                      telephoneController.text, 
                      birthday,
                      passwordController.text,
                      _countryCode,
                    );
                  setMessage(message.toString());
                }
                else{
                  errorMessage = "Hay campos vacíos.";
                }
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