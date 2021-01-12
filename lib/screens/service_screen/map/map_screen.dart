import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/screens/service_screen/map/bloc/map_bloc.dart';
import 'package:papasi/screens/service_screen/shope_detail/shope_detail_screen.dart';

import 'components/map_view.dart';
import 'components/shopes_on_map.dart';

class MapScreen extends StatefulWidget {
  final List<Shope> shops;

  const MapScreen({Key key, this.shops}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState(shops: shops);
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  final List<Shope> shops;
  final _bloc = MapBloc();
  final _pageController = PageController(
    viewportFraction: 0.85,
    initialPage: 1,
  );

  _MapScreenState({this.shops});

  @override
  void initState() {
    super.initState();

    _bloc.add(CurrentLocationEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop at Map'),
        backgroundColor: Colors.white,
      ),
      body: BlocListener<MapBloc, MapState>(
        listener: (context, state) {
          if (state is CurrentLocationState) {
            _gotoLocation(state.posision);
          } else if (state is SuccessState) {
            _gotoShopeDetail(state.shopeDetail);
          } else if (state is FailureState) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text(state.err)));
          }
        },
        cubit: _bloc,
        child: Stack(
          children: [
            MapView(
              onMapCreated: (value) => _onMapCreated(value),
              markers: _getMarkers(),
            ),
            ShopesOnMap(
              pageController: _pageController,
              onPageChanged: (value) => _gotoLocation(value),
              shops: shops,
              onPress: (value) => _bloc.add(
                FetchShopeDetailMapEvent(id: value),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _gotoLocation(LatLng position) async {
    final GoogleMapController controller = await _controller.future;
    final _currenct = CameraPosition(
      target: position,
      zoom: 17,
    );

    controller.animateCamera(
      CameraUpdate.newCameraPosition(_currenct),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _gotoShopeDetail(ShopeDetail shopeDetail) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ShopeDetailScreen(
          shopeDetail: shopeDetail,
        ),
      ),
    );
  }

  Set<Marker> _getMarkers() {
    return Set<Marker>.of(
      shops.map((e) => Marker(
          infoWindow: InfoWindow(
            title: e.name,
            snippet: e.description,
          ),
          onTap: () {
            setState(() {
              _pageController.animateToPage(
                shops.indexOf(e),
                duration: Duration(milliseconds: 600),
                curve: Curves.elasticIn,
              );
            });
          },
          markerId: MarkerId(e.id),
          position: LatLng(e.lat, e.long),
          icon: BitmapDescriptor.defaultMarker)),
    );
  }
}
