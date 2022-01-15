import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fudi_app/src/services/extensions.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/widget_properties.dart';
import 'package:fudi_app/src/widgets/alert_dialog.dart';
import 'package:fudi_app/src/widgets/header.dart';

// Define a custom Form widget.
class SearchForm extends StatefulWidget {
  const SearchForm({Key? key}) : super(key: key);

  @override
  SearchFormState createState() {
    return SearchFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class SearchFormState extends State<SearchForm> {
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
          const SizedBox(height: formFieldHeightGap,),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: null,
            keyboardType: TextInputType.emailAddress,
            cursorColor: accentColorApp,
            decoration: const InputDecoration(
              filled: true,
              fillColor: textFieldColorApp,
              hintText: 'Buscar',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(roundedCornersValue),
                ),
              ),
            ),
          ),
          const SizedBox(height: formFieldHeightGap,),
          headerWithAction(context, 'Recientes', 'Limpiar', (){}),
          _sliderCards(),
        ],
      ),
    );
  }

  Widget _sliderCards(){
  return Container(
    height: 350.0,
    child: Swiper(
      itemCount: 4,
      layout: SwiperLayout.DEFAULT,
      itemBuilder: (BuildContext context, int index){
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index){
            return _card(context);
          },
        );
      },
    ),
  );
}

  Widget _card(BuildContext context){
  return Container(
    margin: const EdgeInsets.all(10.0),
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: const Image(
            width: 150.0,
            height: 120.0,
            fit: BoxFit.cover,
            image: NetworkImage('https://media.istockphoto.com/photos/fresh-homemade-pizza-margherita-picture-id1278998606?b=1&k=20&m=1278998606&s=170667a&w=0&h=BlXvVFfwLwD4ckIF_7sg_mis8ULaqy9sdPgA6grpSo4='),
          ),
        ),
        Container(
          width: 150.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: const Text(
                  'Pizza & Pizza Restaurante',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
              ),
              Container(
                child: const Text(
                  'Calle Número 10, Tlaxcala, Tlax',
                  style: TextStyle(
                    color: disabledColorApp,
                    fontWeight: FontWeight.w500,
                    fontSize: 13.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

  Widget _recents(BuildContext context, String restaurantName, String restaurantAddress, String imageURL){
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image(
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                image: NetworkImage(imageURL),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    restaurantName,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    restaurantAddress,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 16.0,
                      ),
                      const Text(
                        "4.8",
                        style: TextStyle(
                          color: accentColorApp,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0,
                        ),
                      ),
                      const Text(
                        "(223 ratings)",
                        style: TextStyle(
                          color: accentColorApp,
                          fontWeight: FontWeight.w600,
                          fontSize: 13.0,
                        ),
                      ),
                      Container(
                        width: 80.0,
                        height: 20.0,
                        child: RaisedButton(
                          elevation: 0.5,
                          shape: const StadiumBorder(),
                          color: accentColorApp,
                          textColor: Colors.white,
                          onPressed: (){ },
                          child: const Text('Ver', style: TextStyle(fontSize: 11.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

}