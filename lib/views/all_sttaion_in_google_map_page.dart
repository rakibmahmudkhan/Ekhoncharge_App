import 'dart:async';
import 'dart:typed_data';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/my_google_map_controller.dart';
import 'package:ekhoncharge/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AllStationInGoogleMapPage extends StatefulWidget {
  AllStationInGoogleMapPage();

  @override
  State<AllStationInGoogleMapPage> createState() =>
      _AllStationInGoogleMapPageState();
}

final MyGoogleMapController googleMapCtl = Get.find<MyGoogleMapController>();

Completer<GoogleMapController?> _controller = Completer();
Map<PolylineId, Polyline> polylines = {};
PolylinePoints polylinePoints = PolylinePoints();

final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(23.8041, 90.4152), zoom: 9); //(23.8041, 90.4152)

class _AllStationInGoogleMapPageState extends State<AllStationInGoogleMapPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setMarkers();
    });
  }

  void setMarkers() async {
    ByteData bytes = await rootBundle.load('assets/images/profile.jpg');
    BitmapDescriptor bitmapDescriptor =
        BitmapDescriptor.fromBytes(bytes.buffer.asUint8List());

    googleMapCtl.addMarker(
      Marker(
        // icon: bitmapDescriptor,
        markerId: MarkerId("1"),
        position: LatLng(23.8041, 90.4152),
        infoWindow: InfoWindow(title: "Ekhon Charge-Tejgaon"),
      ),
    );
    googleMapCtl.addMarker(
      Marker(
        // icon: bitmapDescriptor,
        markerId: MarkerId("2"),
        position: LatLng(23.4498, 91.1847),
        infoWindow: InfoWindow(title: "Ekhon Charge-Cumilla"),
      ),
    );
    googleMapCtl.addMarker(
      Marker(
        // icon: bitmapDescriptor,
        markerId: MarkerId("3"),
        position: LatLng(21.4272, 92.0061),
        infoWindow: InfoWindow(title: "Ekhon Charge-Cox's  Bazar"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic) {
      return Scaffold(
        appBar: eAppBar(logic, title: 'Stations'),
        body: GetBuilder<MyGoogleMapController>(
          builder: (mGoogleCtl) {
            return SafeArea(
              child: GoogleMap(
                initialCameraPosition: kGooglePlex,
                markers: Set<Marker>.of(mGoogleCtl.markers),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                compassEnabled: false,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            );
          },
        ),
      );
    });
  }
}
