import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/screens/components/loading_progress.dart';
import 'package:papasi/screens/service_screen/map/map_screen.dart';
import 'package:papasi/screens/service_screen/service_group/bloc/service_bloc.dart';
import 'package:papasi/screens/service_screen/shope_detail/shope_detail_screen.dart';

import '../../constant.dart';
import 'bloc/shope_service_bloc.dart';
import 'components/brand_item.dart';

class ShopsServiceScreen extends StatefulWidget {
  final List<Shope> shops;
  final String title;

  const ShopsServiceScreen({
    Key key,
    @required this.shops,
    @required this.title,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _ShopsServiceScreen(shops: shops, title: title);
}

class _ShopsServiceScreen extends State<ShopsServiceScreen>
    with LoadingProgress {
  final List<Shope> shops;
  final String title;
  final _bloc = ShopeServiceBloc(ShopeServiceInitial());

  _ShopsServiceScreen({@required this.shops, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: kGreyLight,
      body: SafeArea(
        child: BlocListener<ShopeServiceBloc, ShopeServiceState>(
          listener: (context, state) {
            if (state is SuccessShopeService) {
              Navigator.of(context).pop();
              _gotoShopeDetail(state.shopeDetail);
            } else if (state is FailureShopeService) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(state.err),
              ));
            } else if (state is LoadingDialogProgress) {
              showDialog(context: context);
            } else if (state is HideDialog) {
              Navigator.of(context).pop();
            }
          },
          cubit: _bloc,
          child: BlocBuilder<ShopeServiceBloc, ShopeServiceState>(
            cubit: _bloc,
            buildWhen: (previous, current) =>
                !(current is LoadingDialogProgress || current is HideDialog),
            builder: (context, state) {
              return ListView.builder(
                itemCount: shops.length,
                itemBuilder: (context, index) => BrandItem(
                  shop: shops[index],
                  onPress: (value) => _bloc.add(FetchShopeDetail(id: value)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.map),
          onPressed: () => _gotoShopeMap(context),
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        )
      ],
    );
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

  void _gotoShopeMap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MapScreen(shops: shops),
        fullscreenDialog: true,
      ),
    );
  }
}
