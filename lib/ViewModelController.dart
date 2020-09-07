/*
* Created by Ahammed Hossain Shanto
* on 8/23/20
*/


import 'package:dotara/view_models/HomeFragmentVM.dart';
import 'package:flutter/cupertino.dart';

class ViewModelController {
  // static EventFragmentVM eventFragmentVM;
  //
  // static EventFragmentVM getEventFragmentVM(BuildContext context) {
  //   if (eventFragmentVM == null) {
  //     eventFragmentVM = new EventFragmentVM(context);
  //   }
  //   return eventFragmentVM;
  // }

  static HomeFragmentVM homeFragmentVM;

  static HomeFragmentVM getHomeFragmentVM(BuildContext context) {
    if (homeFragmentVM == null) {
      homeFragmentVM = new HomeFragmentVM(context);
    }
    return homeFragmentVM;
  }

  // static StoreFragmentVM storeFragmentVM;
  //
  // static StoreFragmentVM getStoreFragmentVM(BuildContext context) {
  //   if (storeFragmentVM == null) {
  //     storeFragmentVM = new StoreFragmentVM(context);
  //   }
  //   return storeFragmentVM;
  // }
  //
  // static MenuVM menuVM;
  // static MenuVM getMenuVM(BuildContext context) {
  //   if(menuVM == null) {
  //     menuVM = new MenuVM(context);
  //   }
  //   else {
  //     menuVM.loadProfile();
  //   }
  //   return menuVM;
  // }
  //
  // static MyMusicVm myMusicVm ;
  //
  // static MyMusicVm getMyMusicFragmentVM(BuildContext context) {
  //   if (myMusicVm == null) {
  //     myMusicVm = new MyMusicVm(context);
  //   }
  //   return myMusicVm;
  // }
  //
  // static MusicPlayerVM musicPlayerVM;
  // static MusicPlayerVM getMusicPlayerVM() {
  //   if(musicPlayerVM == null) {
  //     musicPlayerVM = new MusicPlayerVM();
  //   }
  //   return musicPlayerVM;
  // }
}

