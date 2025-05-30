import 'package:get/get.dart';
import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:pintel_project/core/core.dart';

class LocationController extends GetxController {
  final loc.Location location = loc.Location();

  Rx<LatLng?> currentLocation = Rx<LatLng?>(null);
  Rx<LatLng?> newLocation = Rx<LatLng?>(null);

  RxString address = ''.obs;
  Rx<BitmapDescriptor?> currentLocationIcon = Rx<BitmapDescriptor?>(null);
  Rx<BitmapDescriptor?> selectedLocationIcon = Rx<BitmapDescriptor?>(null);
  Rx<Marker?> currentLocationMarker = Rx<Marker?>(null);
  Rx<MapType> mapType = MapType.normal.obs;

  final Completer<GoogleMapController> mapController = Completer();

  @override
  void onInit() {
    super.onInit();
    _loadCustomIcons();
    getLocation();
  }

  void changeMapType(MapType type) {
    mapType.value = type;
    update();
  }

  Future<void> getLocation() async {
    try {
      loc.LocationData? locData = await getCurrentLocation();
      if (locData != null) {
        LatLng newPosition = LatLng(locData.latitude!, locData.longitude!);
        currentLocation.value = newPosition;

        currentLocationMarker.value = Marker(
          markerId: const MarkerId('current_location'),
          position: newPosition,
          icon: currentLocationIcon.value!,
        );

        _cameraToPosition(newPosition);
        await _getAddressFromLatLng(newPosition);
        // print('object');
        // update();
      }
    } catch (e) {
      debugPrint("Error getting location: $e");
    }
    update();
  }

  Future<loc.LocationData?> getCurrentLocation() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) return null;
    }

    var permissionGranted = await location.hasPermission();
    if (permissionGranted == loc.PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != loc.PermissionStatus.granted) return null;
    }

    return await location.getLocation();
  }

  Future<void> _loadCustomIcons() async {
    currentLocationIcon.value = await createBitmapDescriptorFromIcon(
      icon: Icons.my_location,
      color: ColorResources.transparentColor,
      size: 50.0,
    );
  }

  Future<BitmapDescriptor> createBitmapDescriptorFromIcon({
    required IconData icon,
    required Color color,
    required double size,
  }) async {
    final pictureRecorder = ui.PictureRecorder();
    final canvas = Canvas(pictureRecorder);
    final textPainter = TextPainter(textDirection: ui.TextDirection.ltr)
      ..text = TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
            fontSize: size, fontFamily: icon.fontFamily, color: color),
      )
      ..layout();

    textPainter.paint(canvas, Offset.zero);
    final image = await pictureRecorder
        .endRecording()
        .toImage(size.toInt(), size.toInt());
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData!.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(pngBytes);
  }

  Future<void> _getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        // address.value =
        //     "${place.subThoroughfare ?? ''} ${place.street ?? ''}, ${place.locality ?? ''}, ${place.country ?? ''}"
        //         .trim();
        address.value =
            "${place.subThoroughfare ?? ''} ${place.street ?? ''}, ${place.locality ?? ''}, ${place.country ?? ''}"
                .trim();
      } else {
        address.value = "Address not found";
      }
    } catch (e) {
      address.value = "Error fetching address";
      debugPrint("Error: $e");
    }
    update();
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await mapController.future;
    CameraPosition newPosition = CameraPosition(target: pos, zoom: 20);
    await controller.animateCamera(CameraUpdate.newCameraPosition(newPosition));
  }

  void onCameraMove(CameraPosition position) {
    currentLocation.value = position.target;
    update();
  }

  void onCameraIdle() {
    if (currentLocation.value != null) {
      _getAddressFromLatLng(currentLocation.value!);
      update();
    }
  }
}
