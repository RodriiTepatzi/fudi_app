import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fudi_app/src/controllers/cart_controller.dart';
import 'package:fudi_app/src/models/cart.dart';
import 'package:fudi_app/src/models/user_app.dart';
import 'package:fudi_app/src/services/user_service.dart';
import 'package:fudi_app/src/views/tabs/search_tab.dart';
import 'package:fudi_app/src/views/widgets/bottombar_item.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:fudi_app/src/views/tabs/explore_tab.dart';
import 'package:fudi_app/src/views/tabs/favorites_tab.dart';
import 'package:fudi_app/src/views/tabs/cart_tab.dart';
import 'package:fudi_app/src/views/tabs/profile_tab.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/views/widgets/alert_dialog.dart';

class TabsPage extends StatefulWidget {
  TabsPage({Key? key,}) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> with TickerProviderStateMixin{

  final _auth = FirebaseAuth.instance;
  bool _setData = false;
  int _selectedWidgetIndex = 0;
  List barItems = [
    {
      "icon" : "assets/icons/home.svg",
      "active_icon" : "assets/icons/home.svg",
      "page" : Container(),
    },
    {
      "icon" : "assets/icons/search.svg",
      "active_icon" : "assets/icons/search.svg",
      "page" : Container(),
    },
    {
      "icon" : "assets/icons/bag.svg",
      "active_icon" : "assets/icons/bag.svg",
      "page" : Container(),
    },
    {
      "icon" : "assets/icons/heart.svg",
      "active_icon" : "assets/icons/heart.svg",
      "page" : Container(),
    },
    {
      "icon" : "assets/icons/profile.svg",
      "active_icon" : "assets/icons/profile.svg",
      "page" : Container(),
    },
  ];
  bool _cartIsSet = false;
  final CartController _cartController = CartController();
  
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  void getCart(UserApp? userApp) async{
    if(!_cartIsSet){
      Cart cart = await _cartController.getCart(userApp?.uid ?? "");
      
      setState(() {
        
      });
    }
  }

  void getUser() async{
    User? userData = _auth.currentUser;
    if(userData != null){
      if(userData.uid != null){
        if(!_setData){
          UserApp _userApp = await UserService().getUser(userData.uid.toString());
          if(!_cartIsSet){
            setState(() {
              
              if(_userApp != null){
                barItems = [
                  {
                    "icon" : "assets/icons/home.svg",
                    "active_icon" : "assets/icons/home.svg",
                    "page" : ExploreTab(userApp: _userApp),
                  },
                  {
                    "icon" : "assets/icons/search.svg",
                    "active_icon" : "assets/icons/search.svg",
                    "page" : const SearchTab(),
                  },
                  {
                    "icon" : "assets/icons/bag.svg",
                    "active_icon" : "assets/icons/bag.svg",
                    "page" : CartTab(userApp: _userApp),
                  },
                  {
                    "icon" : "assets/icons/heart.svg",
                    "active_icon" : "assets/icons/heart.svg",
                    "page" : FavoritesTab(),
                  },
                  {
                    "icon" : "assets/icons/profile.svg",
                    "active_icon" : "assets/icons/profile.svg",
                    "page" : ProfileTab(userApp: _userApp),
                  },
                ];
              }
            });
            _setData = true;
          }
        }
      }
    }
  }
  
  @override
  void initState() {
    
    super.initState();
    _controller.forward();
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

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  animatedPage(page){
    return FadeTransition(
      child: page,
      opacity: _animation
    );
  }

  void onPageChanged(int index) {
    _controller.reset();
    setState(() {
      _selectedWidgetIndex = index;
    });
    _controller.forward();
  }

  void ChangeWidget(int index){
    setState(() {
      _selectedWidgetIndex = index;
    });
  }

  void changeColorBar(){
    setState(() {
      if(_selectedWidgetIndex == 1 || _selectedWidgetIndex == 2 || _selectedWidgetIndex == 3 || _selectedWidgetIndex == 4){
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.light.copyWith(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent
          )
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if(!_setData){
      getUser();
    }
    changeColorBar();
    return Scaffold(
      backgroundColor: bgApp,
      bottomNavigationBar: getBottomBar(),
      body: getBarPage()
    );
  }

  Widget getBarPage(){
    return 
      IndexedStack(
        index: _selectedWidgetIndex,
        children: 
          List.generate(barItems.length, 
            (index) => animatedPage(barItems[index]["page"])
          )
      );
  }

  Widget getBottomBar() {
    return Container(
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgCardApp,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25), 
          topRight: Radius.circular(25)
        ), 
        boxShadow: [
          BoxShadow(
            color: accentColorApp.withOpacity(0.1),
            blurRadius: 1,
            spreadRadius: 1,
            offset: const Offset(1, 1)
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15,),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(barItems.length, 
            (index) => BottomBarItem(barItems[index]["icon"], isActive: _selectedWidgetIndex == index, activeColor: accentColorApp,
              onTap: (){
                onPageChanged(index);
              },
            )
          )
        )
      ),
    );
  }

  Future _askLocation(BuildContext context) async{
    showAlertDialog(context, Icons.gps_fixed, 'Active su ubicación', 'Es necesario tener acceso a su ubicación para ofrecerle una mejor experiencia de usuario.', 'Entendido');
    Permission.location.request();
  }
}

