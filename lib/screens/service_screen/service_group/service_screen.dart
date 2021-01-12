import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/screens/components/loading.dart';
import 'package:papasi/screens/components/loading_progress.dart';
import 'package:papasi/screens/service_screen/service_group/components/service_group_list.dart';
import 'package:papasi/screens/service_screen/service_shopes/shops_service_screen.dart';

import '../../constant.dart';
import 'bloc/service_bloc.dart';

class GroupServiceScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GroupServiceScreen();
}

class _GroupServiceScreen extends State<GroupServiceScreen>
    with AutomaticKeepAliveClientMixin, LoadingProgress {
  final _bloc = ServiceBloc(ServiceInitial());

  @override
  void initState() {
    super.initState();
    _fetchList();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
        appBar: _buildAppBar(),
        backgroundColor: kGreyLight,
        body: _buildBody());
  }

  Widget _buildBody() {
    return BlocListener<ServiceBloc, ServiceState>(
      cubit: _bloc,
      listener: (context, state) {
        if (state is GotoShopList) {
          Navigator.of(context).pop();
          _gotoSLABrandScreen(context, state.shops, state.title);
        } else if (state is FailureServiceGroupState) {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.err)));
        } else if (state is LoadingDialog) {
          showLoading(context);
        } else if (state is HideDialog) {
          Navigator.of(context).pop();
        }
      },
      child: BlocBuilder<ServiceBloc, ServiceState>(
        buildWhen: (previous, current) => !(current is GotoShopList ||
            current is LoadingDialog ||
            current is HideDialog),
        cubit: _bloc,
        builder: (context, state) {
          if (state is LoadingServiceGroup) {
            return const LoadingWidget();
          } else if (state is ShowServiceGroup) {
            return ServiceGroupList(
              models: state.serviceGroup,
              onTap: (model) {
                _gotoShopsService(model);
              },
            );
          }
          return Container(
            color: Colors.white,
          );
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        "Discover in Offers",
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: kTextColor,
        ),
      ),
      bottom: PreferredSize(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(bottom: 8, left: 12),
              child: FutureBuilder(
                initialData: null,
                future: _bloc.getCity(),
                builder: (context, AsyncSnapshot<City> snapshot) {
                  if (snapshot.data == null) {
                    return Text("");
                  }
                  return Text(
                    snapshot.data.name,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 11,
                      color: kTextColor,
                    ),
                  );
                },
              ),
            ),
          ),
          preferredSize: Size.fromHeight(0)),
      centerTitle: false,
    );
  }

  void _fetchList() {
    _bloc.add(FetchSLAService());
  }

  void _gotoShopsService(ServiceGroup model) {
    _bloc.add(SelectSLAServiceItem(serviceGroup: model));
  }

  void _gotoSLABrandScreen(
      BuildContext context, List<Shope> shops, String title) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ShopsServiceScreen(
          shops: shops,
          title: title,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
