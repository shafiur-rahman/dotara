import 'dart:convert';

import 'package:dotara/mock_response/MockResponse.dart';
import 'package:flutter/cupertino.dart';

class MusicCatergorySelectVM with ChangeNotifier{

  BuildContext context;
  bool saveGenre = false;
  bool musicListLoaded = false;
  List genreSelect = [];
  List<int> selectedSuggIds = new List();
  MusicCatergorySelectVM(this.context){
    loadGenreType();

  }


  getFavoriteGenre() {
    List genreIds = new List();
    for(int i = 0; i < selectedSuggIds.length; i++) {
      genreIds.add({
        "id": selectedSuggIds[i],
      });
    }
    return genreIds;
  }

  saveFavoriteGenre(){
    saveGenre = true;
    notifyListeners();
  }





  bool isSelected(int id) {
    for(int i = 0; i < selectedSuggIds.length; i++) {
      if(selectedSuggIds[i] == id) {
        return true;
      }
    }
    return false;
  }

  toggleSelection(int id) {
    for(int i = 0; i < selectedSuggIds.length; i++) {
      if(selectedSuggIds[i] == id) {
        selectedSuggIds.removeAt(i);
        notifyListeners();
        return;
      }
    }
    selectedSuggIds.add(id);
    notifyListeners();
  }

  loadGenreType(){
    musicListLoaded = false;
    var response = jsonDecode(MockResponse.getGenreList());
    musicListLoaded = true;
    genreSelect = response["items"];
    print(genreSelect);

  }






}