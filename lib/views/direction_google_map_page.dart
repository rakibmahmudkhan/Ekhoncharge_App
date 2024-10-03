import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/my_google_map_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math' as math;
class DirectionGoogleMapPage extends StatefulWidget {
  const DirectionGoogleMapPage({Key? key}) : super(key: key);

  @override
  State<DirectionGoogleMapPage> createState() => _DirectionGoogleMapPageState();
}
final MyGoogleMapController myGoogleMapController= MyGoogleMapController();
class _DirectionGoogleMapPageState extends State<DirectionGoogleMapPage> {
  final CameraPosition kGooglePlex =
      CameraPosition(target: LatLng(23.8041, 90.4152), zoom: 9);


  LatLng? currentPosition;
  Set<Polyline> polylines = {};
  GoogleMapController? mapController;
  String? distanceText;
  String? durationText;

  static const googlePlex = LatLng(23.8041, 90.4152);
  static const dhakaLocation = LatLng(23.8041, 90.4152);
  static const comillaLocation = LatLng(23.4498, 91.1847);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) async => await initializeMap());
  }

  Future<void> initializeMap() async {
    await fetchCurrentLocation();
    if (currentPosition != null) {
      final coordinates = await fetchPolylinePoints();
      generatePolyLineFromPoints(coordinates);
      await fetchDistanceAndDuration();
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) =>
    GetBuilder<AppSystemController>(
  builder: (logic) {
    return  Scaffold(
      body: currentPosition == null
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
            child: Column(
                    children: [
            Expanded(
              flex:5,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: currentPosition!,
                  zoom: 13,
            
                ),
               // mapType: logic.isDarkTheme ? MapType.normal : MapType.normal,
                markers: {
                  Marker(
                    markerId: MarkerId('currentLocation'),
                    icon: BitmapDescriptor.defaultMarker,
                    position: currentPosition!,
                  ),
                  Marker(
                    markerId: MarkerId('comillaLocation'),
                    icon: BitmapDescriptor.defaultMarker,
                    position: comillaLocation,
                  ),
                },
                polylines: polylines,
                onMapCreated: (controller) {
                  mapController = controller;
                },
              ),
            ),
            /* Expanded(
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Distance: $distanceText'),
                      Text('Duration: $durationText'),
                    ],
                  ),)*/
                    ],
                  ),
          ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: logic.isDarkTheme?eLightThemeBorderCLR:eHintCLR,
        onPressed: () => updateCurrentLocation(),
        child: Icon(Icons.location_searching,color: logic.isDarkTheme?eWhiteCLR:eWhiteCLR,),

      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.miniCenterFloat,
    );
  });


  Future<void> fetchCurrentLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

    setState(() {
      currentPosition = LatLng(position.latitude, position.longitude);
    });
  }

  Future<List<LatLng>> fetchPolylinePoints() async {
    final polylinePoints = PolylinePoints();
    final PointLatLng? currentPoint = currentPosition != null
        ? PointLatLng(currentPosition!.latitude, currentPosition!.longitude)
        : null;
    final PointLatLng comillaPoint = PointLatLng(23.4498, 91.1847);

    if (currentPoint != null) {
      try {
        final result = await polylinePoints.getRouteBetweenCoordinates(
          googleMapApiKey,
          currentPoint,
          comillaPoint,
        );

        if (result.points.isNotEmpty) {
          return result.points
              .map((point) => LatLng(point.latitude, point.longitude))
              .toList();
        }
      } catch (e) {
        // Handle polyline fetch error
        print("Error fetching polyline points: $e");
      }
    }
    return [];
  }
  Future<void> fetchDistanceAndDuration() async {
    if (currentPosition == null) return;
    final String origin =
        "${currentPosition!.latitude},${currentPosition!.longitude}";
    final String destination = "${comillaLocation.latitude},${comillaLocation.longitude}";
    final String apiUrl =
        'https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=$origin&destinations=$destination&key=$googleMapApiKey&traffic_model=best_guess';

    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final rows = responseData['rows'] as List<dynamic>;
      if (rows.isNotEmpty) {
        final elements = rows[0]['elements'] as List<dynamic>;
        if (elements.isNotEmpty) {
          setState(() {
            distanceText = elements[0]['distance']['text'];
            durationText = elements[0]['duration']['text'];
            String? trafficDurationText = elements[0]['duration_in_traffic']['text'];
            if (trafficDurationText != null) {
              durationText = trafficDurationText;
            }
          });
        }
      }
    } else {
      print('Failed to fetch distance and duration: ${response.statusCode}');
    }
  }



  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) {
    if (polylineCoordinates.isEmpty) {
      print('Empty polyline coordinates');
      return;
    }

    final polylineId = PolylineId('polyline');
    final polyline = Polyline(
      polylineId: polylineId,
      color: Colors.blueAccent,
      points: polylineCoordinates,
      width: 5,
    );

    setState(() {
      polylines.clear();
      polylines.add(polyline);
    });

    final bounds = LatLngBounds(
      southwest: polylineCoordinates.reduce(
              (value, point) => LatLng(math.min(value.latitude, point.latitude),
              math.min(value.longitude, point.longitude))),
      northeast: polylineCoordinates.reduce(
              (value, point) => LatLng(math.max(value.latitude, point.latitude),
              math.max(value.longitude, point.longitude))),
    );

    print('Bounds: $bounds');

    if (mapController != null) {
      mapController!.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
    }
  }

/*  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) {
    final polylineId = PolylineId('polyline');
    final polyline = Polyline(
      polylineId: polylineId,
      color: Colors.blueAccent,
      points: polylineCoordinates,
      width: 5,
    );
    setState(() {
      polylines.clear(); // Clear existing polylines
      polylines.add(polyline); // Add new polyline
    });

    if (mapController != null && polylineCoordinates.isNotEmpty) {
      final bounds = LatLngBounds(
        southwest: polylineCoordinates.first,
        northeast: polylineCoordinates.last,
      );
      mapController!.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
    }
  }*/

  Future<void> updateCurrentLocation() async {
    await fetchCurrentLocation();
    if (currentPosition != null) {
      final coordinates = await fetchPolylinePoints();
      generatePolyLineFromPoints(coordinates);
      await fetchDistanceAndDuration();
      mapController?.animateCamera(
        CameraUpdate.newLatLng(currentPosition!),
      );
    }
  }
}
