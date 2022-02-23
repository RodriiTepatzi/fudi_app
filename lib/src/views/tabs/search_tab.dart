import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/views/forms/search_form.dart';
import 'package:fudi_app/src/views/widgets/header.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: bgApp,
      )
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: const[
                      SearchForm(key: ValueKey('search-form')),
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

