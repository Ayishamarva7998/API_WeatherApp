

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider extends ChangeNotifier{
 


    Position? _currentPosition;
    Position? get currentPosition => _currentPosition; 

    Future<void> determinedPosition()async{

      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled =await Geolocator.isLocationServiceEnabled();

      if(!serviceEnabled){
        _currentPosition=null;
        notifyListeners();
        return;

      }
      permission=await Geolocator.checkPermission();
      if(permission==LocationPermission.denied){
        permission=await Geolocator.checkPermission();

        if(permission==LocationPermission.denied){
          _currentPosition =null;
          notifyListeners(); 
          return;
        }
      }
      if(permission==LocationPermission.deniedForever){
        _currentPosition =null;
        notifyListeners();
        return;
      }
      _currentPosition =await Geolocator.getCurrentPosition();
      (_currentPosition);
      notifyListeners();
      return;


    }


  //permission
    
  //get the location

  //placemark
}