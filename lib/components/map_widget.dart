import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:foodie_finder/services/location_service.dart';

class MapWidget extends StatefulWidget {
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late NaverMapController _mapController;
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    Position position = await LocationService().getCurrentLocation();
    setState(() {
      _currentPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _currentPosition == null
        ? Center(child: CircularProgressIndicator())
        : NaverMap(
            onMapCreated: onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(
                  _currentPosition!.latitude, _currentPosition!.longitude),
              zoom: 15,
            ),
            markers: [
              Marker(
                position: LatLng(
                    _currentPosition!.latitude, _currentPosition!.longitude),
              ),
            ],
            onCameraChange: (position, reason, isGesture) {
              // 지도가 드래그될 때의 로직 추가
            },
          );
  }

  void onMapCreated(NaverMapController controller) {
    _mapController = controller;
  }
}
