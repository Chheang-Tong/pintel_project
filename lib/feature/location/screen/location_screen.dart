import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../common/common.dart';
import '../../../core/core.dart';
import '../../feature.dart';

class Location extends StatefulWidget {
  final bool move;
  final bool showbtn;
  const Location({
    super.key,
    required this.move,
    required this.showbtn,
  });
  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final LocationController controller = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              controller.currentLocation.value == null
                  ? AnimatedLoadingIndicator()
                  : GoogleMap(
                      mapType: controller.mapType.value,
                      liteModeEnabled:
                          widget.move, // disable map interaction if true
                      zoomControlsEnabled: false,
                      onMapCreated: (GoogleMapController mapCtrl) async {
                        if (!controller.mapController.isCompleted) {
                          controller.mapController.complete(mapCtrl);
                        }
                      },
                      initialCameraPosition: CameraPosition(
                        target: controller.mainLocation.value ??
                            controller.currentLocation.value!,
                        zoom: 16,
                      ),
                      markers: {
                        if (controller.mainLocation.value != null &&
                            controller.selectedLocationIcon.value != null)
                          Marker(
                            markerId: const MarkerId('main_location'),
                            position: controller.mainLocation.value!,
                            icon: controller.selectedLocationIcon.value!,
                          ),
                      },

                      onCameraMove: controller.onCameraMove,
                      onCameraIdle: controller.onCameraIdle,
                    ),
              if (controller.currentLocation.value != null)
                Center(child: SvgPicture.asset('assets/image/map_marker.svg')),
              if (widget.showbtn)
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      controller.getLocation();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.my_location,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              Container(
                height: 40,
                width: 105,
                margin: EdgeInsets.all(4),
                padding: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: ColorResources.whiteColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => controller.changeMapType(MapType.normal),
                      child: Text('Map'),
                    ),
                    VerticalDivider(),
                    GestureDetector(
                      onTap: () => controller.changeMapType(MapType.satellite),
                      child: Text('Satellite'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
