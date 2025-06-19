import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:pintel_project/common/components/loading/milti_loading.dart';

class Testing extends StatefulWidget {
  const Testing({super.key});
  @override
  State<Testing> createState() => _TestState();
}

class _TestState extends State<Testing> {
  Marker? _currentLocationMarker;
  LatLng? _currentLocation;
  BitmapDescriptor? currentLocationIcon;
  BitmapDescriptor? selectedLocationIcon;
  final loc.Location location = loc.Location();
  final Completer<GoogleMapController> _mapController = Completer();
  String address = "";
  MapType currentMapType = MapType.normal;
  @override
  void initState() {
    super.initState();
    _loadCustomIcons();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: Stack(
          children: [
            _currentLocation == null
                ? Center(child: LoadingIndicator())
                : GoogleMap(
                    mapType: currentMapType,
                    zoomControlsEnabled: false,
                    onMapCreated: (GoogleMapController controller) async {
                      _mapController.complete(controller);
                    },
                    initialCameraPosition: CameraPosition(
                      target: _currentLocation!,
                      zoom: 20,
                    ),
                    onTap: _onMapTap,
                    markers: {
                      if (_currentLocationMarker != null)
                        _currentLocationMarker!,
                      if (selectedLocationIcon != null &&
                          _currentLocation != null)
                        Marker(
                          markerId: const MarkerId('selected_location'),
                          position: _currentLocation!,
                          icon: selectedLocationIcon!,
                        ),
                    },
                    onCameraMove: (CameraPosition position) async {
                      if (_currentLocation != null) {
                        await _getAddressFromLatLng(position.target);
                        setState(() {
                          _currentLocation = position.target;
                        });
                      }
                    },
                    onCameraIdle: () async {
                      if (_currentLocation != null) {
                        await _getAddressFromLatLng(_currentLocation!);
                      }
                    },
                  ),
            // Center(child: SvgPicture.asset('assets/image/map_marker.svg')),
          ],
        ));
  }

  Future<void> getLocation() async {
    try {
      loc.LocationData? currentLocation = await getCurrentLocation();
      if (currentLocation != null) {
        setState(() {
          _currentLocation =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          _currentLocationMarker = Marker(
            markerId: const MarkerId('current_location'),
            position: _currentLocation!,
            icon: currentLocationIcon!,
          );
        });
        _cameraToPosition(_currentLocation!);
        await _getAddressFromLatLng(
          _currentLocation!,
        ); // Get the address after fetching the location
      } else {
        debugPrint("Location is null");
      }
    } catch (e) {
      debugPrint("Error getting location: $e");
    }
  }

  Future<void> _loadCustomIcons() async {
    currentLocationIcon = await createBitmapDescriptorFromAssetImage(
      assetPath: 'assets/image/map_marker.png',
      width: 80,
      height: 80,
    );
  }

  Future<BitmapDescriptor> createBitmapDescriptorFromAssetImage({
    required String assetPath,
    required double width,
    required double height,
  }) async {
    return await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(width, height)),
      assetPath,
    );
  }

  Future<loc.LocationData?> getCurrentLocation() async {
    bool serviceEnabled;
    loc.PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == loc.PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != loc.PermissionStatus.granted) {
        return null;
      }
    }

    return await location.getLocation();
  }

  Future<void> _onMapTap(LatLng tappedLocation) async {
    setState(() {
      _currentLocation = tappedLocation;
      _currentLocationMarker = Marker(
        markerId: const MarkerId('current_location'),
        position: tappedLocation,
        icon: currentLocationIcon!,
      );
    });

    await _cameraToPosition(tappedLocation);
    await _getAddressFromLatLng(tappedLocation);
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // content: Text('Selected: $address'),
        content: Text(
            'Latlng:${tappedLocation.latitude},${tappedLocation.longitude}'),
      ),
    );
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition newCameraPosition = CameraPosition(target: pos, zoom: 20);
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
  }

  Future<void> _getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        setState(() {
          address =
              "${place.subThoroughfare ?? ''} ${place.street ?? ''}, ${place.locality ?? ''}, ${place.country ?? ''}"
                  .trim();
        });
      } else {
        setState(() {
          address = "Address not found";
        });
      }
    } catch (e) {
      setState(() {
        address = "Error fetching address";
      });
      debugPrint("Error: $e");
    }
  }
}
