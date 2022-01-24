import 'package:flutter/material.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/views/forms/search_form.dart';
import 'package:fudi_app/src/views/widgets/header.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: bgApp,
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              }, 
              icon: const Icon(
                Icons.close,
                color: Colors.black,
                size: 40.0,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15.0),
                        alignment: Alignment.centerLeft,
                        child: headerText('Buscar', Colors.black, 32.0, FontWeight.bold),
                      ),
                      const SearchForm(key: ValueKey('search-form')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

