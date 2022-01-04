// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use, non_constant_identifier_names, prefer_const_constructors_in_immutables

import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:fudi_app/src/pages/tabs/explore_tab.dart';
import 'package:fudi_app/src/pages/tabs/favorites_tab.dart';
import 'package:fudi_app/src/pages/tabs/my_order_tab.dart';
import 'package:fudi_app/src/pages/tabs/profile_tab.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/widgets/alert_dialog.dart';

class TabsPage extends StatefulWidget {
  TabsPage({Key? key}) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final statusLocation = await Permission.location.request();
      if (statusLocation == PermissionStatus.granted){

      }
      else if(statusLocation == PermissionStatus.denied){
        _askLocation(context);
      }
      else if(statusLocation == PermissionStatus.permanentlyDenied){
        _askLocation(context);
      }
    });
  }

  List<Widget> widgetsOptions = [
    ExploreTab(),
    MyOrderTab(),
    FavoritesTab(),
    ProfileTab(),
  ];

  int _selectedWidgetIndex = 0;

  void ChangeWidget(int index){
    setState(() {
      _selectedWidgetIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsOptions.elementAt(_selectedWidgetIndex),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
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

