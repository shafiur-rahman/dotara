import 'package:dotara/fragments/EventFragment.dart';
import 'package:dotara/fragments/HomeFragment.dart';
import 'package:dotara/fragments/MyMusicFragment.dart';
import 'package:dotara/values/ColorsLocal.dart';
import 'package:flutter/material.dart';

class HomeVM with ChangeNotifier {
  BuildContext context;
  var navbarIndex;

  HomeVM(this.context) {}

  List<Widget> getNavbarItems() {
    return [
      Column(
        children: [
          IconButton(
            padding:const EdgeInsets.all(0.0),
            icon: Icon(

              Icons.home,
              color: navbarIndex == 0
                  ?
              ColorsLocal.hexToColor("ED642C")
                  : Colors.grey[400].withOpacity(.4),
              size: 24,
            ),
            tooltip: "Home",
            onPressed: () {
              if (navbarIndex != 0) {
                navbarIndex = 0;
                notifyListeners();
              }
            },
          ),
          Text(
            "Home",
            style: TextStyle(
              color: navbarIndex == 0
                  ? ColorsLocal.hexToColor("ED642C")
                  : Colors.grey[400].withOpacity(.4),
              fontFamily: "BalooDa2",
              fontWeight: FontWeight.w600,
              fontSize: 12,),
          ),
        ],
      ),
      Column(
        children: [
          IconButton(
            padding:const EdgeInsets.all(0.0),
            icon: Icon(
              Icons.network_check,
              color: navbarIndex == 1
                  ? ColorsLocal.hexToColor("ED642C")
                  : Colors.grey[400].withOpacity(.4),
              size: 24,
            ),
            tooltip: "Store",
            onPressed: () {
              if (navbarIndex != 1) {
                navbarIndex = 1;
                notifyListeners();
              }
            },
          ),
          Text(
            "Live Music",
            style: TextStyle(
                color: navbarIndex == 1
                    ? ColorsLocal.hexToColor("ED642C")
                    : Colors.grey[400].withOpacity(.4),
                fontFamily: "BalooDa2",
                fontWeight: FontWeight.w600,
                fontSize: 12),
          ),
        ],
      ),
      Container(),
      Column(
        children: [
          IconButton(
            icon: Icon(
              Icons.library_music,
              color: navbarIndex == 3
                  ? ColorsLocal.hexToColor("ED642C")
                  : Colors.grey[400].withOpacity(.4),
              size: 24,
            ),
            tooltip: "Music",
            onPressed: () {
              if (navbarIndex != 3) {
                navbarIndex = 3;
                notifyListeners();
              }
            },
          ),
          Text(
            "My Music",
            style: TextStyle(
                color: navbarIndex == 3
                    ? ColorsLocal.hexToColor("ED642C")
                    : Colors.grey[400].withOpacity(.4),
                fontFamily: "BalooDa2",
                fontWeight: FontWeight.w600,
                fontSize: 12),
          ),
        ],
      ),
      Column(
        children: [
          IconButton(
            icon: Icon(
              Icons.event,
              color: navbarIndex == 4
                  ? ColorsLocal.hexToColor("ED642C")
                  : Colors.grey[400].withOpacity(.4),
              size: 24,
            ),
            tooltip: "Profile",
            onPressed: () {
              if (navbarIndex != 4) {
                navbarIndex = 4;
                notifyListeners();
              }
            },
          ),
          Text(
            "Event",
            style: TextStyle(
                color: navbarIndex == 4
                    ? ColorsLocal.hexToColor("ED642C")
                    : Colors.grey[400].withOpacity(.4),
                fontFamily: "BalooDa2",
                fontWeight: FontWeight.w600,
                fontSize: 12),
          ),
        ],
      ),
    ];
  }

  homeClicked() {
    if (navbarIndex != 2) {
      navbarIndex = 2;
      notifyListeners();
    }
  }

  Widget getHomeContent() {

    if (navbarIndex == 0) {
      return HomeFragment();
    }
else  if (navbarIndex == 3) {
      return MyMusicFragment();
    }
    else  if (navbarIndex == 1) {
      return EventFragment();
    }

    else {
      return HomeFragment();
    }
  }
}