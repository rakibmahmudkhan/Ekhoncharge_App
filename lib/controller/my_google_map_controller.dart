import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyGoogleMapController extends GetxController {
  List<Marker> _markers = [];

  List<Marker> get markers => _markers;
  Rx<double> _lat = Rx<double>(0.0);
  Rx<double> _lon = Rx<double>(0.0);


  set lat(  value) {
    _lat.value = value;
    update();
  }

  set lon(  value) {
    _lon.value = value;
    update();
  }


  Rx<double> get lat => _lat;

  Rx<double> get lon => _lon;

  void addMarker(Marker newMarker) {
    _markers.add(newMarker);
  }

  void removeMarker(MarkerId markerId) {
    _markers.removeWhere((marker) => marker.markerId == markerId);
    update();
  }



  Future<Position?> currentLocation() async{
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
 print(position.longitude);
  }


}

/*  List<Marker> _list = const [
    Marker(markerId: MarkerId("1"), position: LatLng(23.8041, 90.4152),
        infoWindow: InfoWindow(title:"Ekhon Charge Station ")
    ), Marker(markerId: MarkerId("2"), position: LatLng(23.8041, 90.1123),
        infoWindow: InfoWindow(title:"Ekhon Charge Station 2")
    )
  ];*/
