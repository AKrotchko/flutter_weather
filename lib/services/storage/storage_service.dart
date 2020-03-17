
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {

  var _prefs;
  List<String> savedZips = List();
  List<String> savedPlaces = List();

  StorageService() {
    initializePreferences();
  }

  initializePreferences() async {
    print('initilizing preferences');
    _prefs = await SharedPreferences.getInstance();
  }

  getSavedAddresses() async {
    savedZips = await _prefs.getStringList('savedZips');
    return savedZips;
  }

  setSavedAddresses() async {
    await _prefs.setStringList('savedZips', savedZips);
  }

  getSavedPlaces() async {
    savedPlaces = await _prefs.getStringList('savedPlaces');
    return savedPlaces;
  }

  setSavedPlaces() async {
    await _prefs.setStringList('savedPlaces', savedPlaces);
  }
}