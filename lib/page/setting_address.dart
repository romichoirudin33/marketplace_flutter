import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingAddressPage extends StatefulWidget {
  @override
  _SettingAddressPageState createState() => _SettingAddressPageState();
}

class _SettingAddressPageState extends State<SettingAddressPage> {
  //  bool _isLoading = false;

  String _address = 'Jalan maju mundur bersama';

  SharedPreferences sharedPreferences;

  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(-6.182627, 106.831565);
  final Set<Marker> _markers = Set();
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    addMarker(_center);
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
    _updatePosition(position);
  }

  void addMarker(LatLng mLatLng) {
    setState(() {
      _markers.add(Marker(
          // This marker id can be anything that uniquely identifies each marker.
          markerId: MarkerId('title'),
          position: mLatLng,
          infoWindow: InfoWindow(
            title: 'someTile',
            snippet: 'some desc',
          ),
          icon: BitmapDescriptor.defaultMarker));
    });
  }

  void _updatePosition(CameraPosition _position) async {
    final coordinates =
        new Coordinates(_lastMapPosition.latitude, _lastMapPosition.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print("${first.addressLine}");

    setState(() {
      _address = "${first.addressLine}";

      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          infoWindow:
              InfoWindow(title: 'this is title', snippet: 'this is snippet'),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }

  Future<void> _getLocation() async {
    var currentLocation = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

    CameraPosition _kLake = CameraPosition(
        bearing: 0,
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        tilt: 0,
        zoom: 17.5);

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));

    final coordinates =
        new Coordinates(currentLocation.latitude, currentLocation.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print("${first.addressLine}");

    setState(() {
      _address = "${first.addressLine}";

      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: LatLng(currentLocation.latitude, currentLocation.longitude),
          infoWindow: InfoWindow(
              title: 'Alamat',
              snippet: "${first.locality} : ${first.addressLine}"),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }

  Widget button(Function function, IconData iconData) {
    return FloatingActionButton(
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.green,
      child: Icon(
        iconData,
        size: 36,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    checkSharedPreference();
  }

  void checkSharedPreference() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pilih lokasi'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    GoogleMap(
                      onMapCreated: _onMapCreated,
                      mapType: _currentMapType,
                      initialCameraPosition: CameraPosition(
                        target: _center,
                        zoom: 14.0,
                      ),
                      markers: _markers,
                      onCameraMove: _onCameraMove,
                      myLocationButtonEnabled: false,
                      myLocationEnabled: true,
                      compassEnabled: true,
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Column(
                          children: <Widget>[
                            button(_getLocation, Icons.location_on),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 150,
                color: Colors.white,
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Alamat',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(_address),
                            ),
                          ],
                        ),
                      ),
                    ),
                    RaisedButton(
                        child: Text('Pilih'), onPressed: _onChooseAddress)
                  ],
                ),
              )
            ],
          ),
        ));
  }

  void _onChooseAddress() {}
}
