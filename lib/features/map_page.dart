import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapController _mapController = MapController();
  final TextEditingController _searchController = TextEditingController();

  LatLng? userLocation;
  Marker? _userMarker;
  final List<Marker> _markers = [];
  StreamSubscription<Position>? _positionStreamSubscription;

  @override
  void initState() {
    super.initState();

    DeviceOrientation.portraitUp;
    _initializeMarkers();
    _startLocationUpdates();
  }

  @override
  void dispose() {
    _positionStreamSubscription?.cancel();
    super.dispose();
  }

  void _initializeMarkers() {
    _markers.addAll([
      const Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(14.5995, 120.9842), // Example position (Manila)
        child: Icon(
          Icons.location_on,
          size: 40.0,
          color: Colors.red,
        ),
      ),
      const Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(10.3157, 123.8854), // Example position (Cebu)
        child: Icon(
          Icons.place,
          size: 40.0,
          color: Colors.blue,
        ),
      ),
    ]);
  }

  Future<void> _searchLocation() async {
    String query = _searchController.text.trim();
    if (query.isNotEmpty) {
      try {
        List<Location> locations = await locationFromAddress(query);

        debugPrint("Geocoding result: $locations");

        if (locations.isEmpty) {
          _showErrorDialog('No locations found for "$query".');
        } else {
          Location location = locations.first;
          debugPrint(
              "Location found: ${location.latitude}, ${location.longitude}");

          _mapController.move(
              LatLng(location.latitude, location.longitude), 13.0);
        }
      } catch (e) {
        debugPrint("Geocoding error: $e");
        _showErrorDialog('Error: $e');
      }
    } else {
      _showErrorDialog('Please enter a valid address to search.');
    }
  }

  void _startLocationUpdates() {
    _positionStreamSubscription = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 2, // Update every 10 meters
      ),
    ).listen((Position position) {
      LatLng newLocation = LatLng(position.latitude, position.longitude);
      setState(() {
        userLocation = newLocation;
        _updateUserMarker(newLocation);
      });
    });
  }

  void _updateUserMarker(LatLng location) {
    if (_userMarker != null) {
      _markers.remove(_userMarker);
    }
    _userMarker = Marker(
      width: 80.0,
      height: 80.0,
      point: location,
      child: const Icon(
        Icons.my_location,
        size: 40.0,
        color: Colors.cyan,
      ),
    );
    _markers.add(_userMarker!);
  }

  Future<void> _moveToUserLocation() async {
    if (userLocation != null) {
      _mapController.move(userLocation!, 18.0);
    } else {
      _showErrorDialog('User location is not available.');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Ok"),
          ),
        ],
      ),
    );
  }

  Future<void> showUserLocationString() async {
    if (userLocation != null) {
      try {
        List<Placemark> placemarks = await placemarkFromCoordinates(
            userLocation!.latitude, userLocation!.longitude);
        Placemark place = placemarks.first;

        String address =
            '${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}';

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Your location: $address')),
        );
      } catch (e) {
        debugPrint('Error retrieving address: $e');
        _showErrorDialog('Error retrieving address: $e');
      }
    } else {
      _showErrorDialog('User location is not available.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: userLocation ?? LatLng(14.5995, 120.9842),
                initialZoom: 13.0,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(markers: _markers),
              ],
            ),
            Positioned(
                top: 20,
                left: 16,
                right: 16,
                child: Material(
                  elevation: 5.0,
                  shadowColor: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  child: TextFormField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.location_searching_outlined,
                        color: Color(0xffafafaf),
                      ),
                      labelText: 'Search Map',
                      labelStyle: const TextStyle(color: Color(0xffafafaf)),
                      floatingLabelStyle: const TextStyle(
                        color: Colors.blue,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onFieldSubmitted: (_) {
                      _searchLocation();
                    },
                  ),
                )),
            Positioned(
              top: 100,
              right: 16,
              child: GestureDetector(
                onTap: _moveToUserLocation,
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: const BoxDecoration(
                    color: Color(0xff32ade6),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.location_searching,
                    size: 25.0,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: Color(0xff32ade6),
        floatingActionButton: SizedBox(
          height: 90,
          width: 90,
          child: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("SOS Alert"),
                  content: const Text(
                      "Your SOS alert has been successfully sent. Stay safe."),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Ok"),
                    ),
                  ],
                ),
              );
            },
            backgroundColor: const Color.fromARGB(255, 239, 66, 63),
            shape: const CircleBorder(),
            child: const Text(
              'SOS',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  fontFamily: 'SfPro',
                  color: Colors.white,
                  letterSpacing: 3),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color(0xff32ade6),
          shape: const CircularNotchedRectangle(),
          notchMargin: 6.0,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.home),
                      iconSize: 30,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, 'dash');
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.map),
                      color: Colors.white,
                      onPressed: () {
                        if (ModalRoute.of(context)?.settings.name != 'map') {
                          Navigator.pushNamed(context, 'map');
                        }
                      },
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(Icons.notifications),
                      iconSize: 30,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, 'notifications');
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.person),
                      iconSize: 30,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, 'profile');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
