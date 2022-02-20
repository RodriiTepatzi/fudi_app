// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use, non_constant_identifier_names, prefer_const_constructors_in_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fudi_app/src/models/user_app.dart';
import 'package:fudi_app/src/services/auth_service.dart';
import 'package:fudi_app/src/services/user_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:fudi_app/src/views/tabs/explore_tab.dart';
import 'package:fudi_app/src/views/tabs/favorites_tab.dart';
import 'package:fudi_app/src/views/tabs/my_order_tab.dart';
import 'package:fudi_app/src/views/tabs/profile_tab.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/views/widgets/alert_dialog.dart';

class TabsPage extends StatefulWidget {

  TabsPage({Key? key}) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {

  final _auth = FirebaseAuth.instance;
  int _selectedWidgetIndex = 0;
  List<Widget> _widgetsOptions = [];


  late UserApp _userApp;
  
  @override
  void initState() {
    User? userData = _auth.currentUser;
    if(userData != null){
      if(userData.uid != null){
        UserService().getUser(userData.uid.toString()).then((value){
          setState(() {
            _userApp = value;
          });
        }).whenComplete((){
          setState(() {
            if(_userApp != null){
              _widgetsOptions = [
                ExploreTab(),
                MyOrderTab(),
                FavoritesTab(),
                ProfileTab(userApp: _userApp),
              ];
            }
          });
        });
      }
    }
    super.initState();
  }
  
    /*Future.delayed(Duration.zero, () async {
      final statusLocation = await Permission.location.request();
      if (statusLocation == PermissionStatus.granted){

      }
      else if(statusLocation == PermissionStatus.denied){
        _askLocation(context);
      }
      else if(statusLocation == PermissionStatus.permanentlyDenied){
        _askLocation(context);
      }
    });*/

  

  void ChangeWidget(int index){
    setState(() {
      _selectedWidgetIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: bgApp,
      )
    );

    if(_widgetsOptions.isNotEmpty){
      return Scaffold(
        body: _widgetsOptions.elementAt(_selectedWidgetIndex),
        bottomNavigationBar: _bottomNavigationBar(context),
      );
    }
    else{
      return Container();
    }
  }

  Widget _bottomNavigationBar(BuildContext context){
  return BottomNavigationBar(
    type: BottomNavigationBarType.shifting,
    //backgroundColor: bgBarApp,
    selectedItemColor: selectedItemBarApp,
    unselectedItemColor: unselectedItemBarApp,
    currentIndex: _selectedWidgetIndex,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    onTap: ChangeWidget,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Explorar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: 'Mis ordenes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Favoritos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_pin),
          label: 'Perfil',
        ),
      ],
    );
  }

  Future _askLocation(BuildContext context) async{
    showAlertDialog(context, Icons.gps_fixed, 'Active su ubicación', 'Es necesario tener acceso a su ubicación para ofrecerle una mejor experiencia de usuario.', 'Entendido');
    Permission.location.request();
  }
}

