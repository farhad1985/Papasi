import 'package:flutter/material.dart';
import 'package:papasi/screens/service_screen/service_shopes/components/brand_item.dart';
import 'package:papasi/screens/service_screen/shope_detail/shope_detail_screen.dart';

class SLABrandsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SLABrandsScreen();
}

class _SLABrandsScreen extends State<SLABrandsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            BrandItem(onPress: (value) => _gotoServiceDetail()),
            BrandItem(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text("Service"),
      actions: <Widget>[
        InkWell(
          child: Icon(Icons.search),
          onTap: () {},
        )
      ],
    );
  }

  void _gotoServiceDetail() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ShopeDetailScreen(),
      ),
    );
  }
}
