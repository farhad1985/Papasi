import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papasi/screens/city/bloc/city_bloc.dart';
import 'package:papasi/screens/components/loading.dart';
import 'package:papasi/screens/constant.dart';
import 'package:papasi/screens/home/home_screen.dart';

import 'components/around_me.dart';
import 'components/city_list_view.dart';
import 'components/header_city.dart';
import 'components/text_input_search.dart';

class CityScreen extends StatelessWidget {
  final _bloc = CityBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                HeaderCity(),
                SizedBox(height: 20),
                TextInputSearch(
                    value: (value) => _bloc.add(SearchCityEvent(name: value))),
                SizedBox(height: 8),
                _buildBloc(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(color: kBorder, height: 1),
                ),
                AroundMe(onPress: () => _bloc.add(AroundMeCity()))
              ],
            ),
          ),
        ),
      ),
    );
  }

  BlocListener<CityBloc, CityState> _buildBloc() {
    return BlocListener<CityBloc, CityState>(
      listener: (context, state) {
        if (state is FailureCity) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(state.err),
          ));
        } else if (state is GotoHomeScreen) {
          _gotoHomeScreen(context);
        }
      },
      cubit: _bloc,
      child: BlocBuilder<CityBloc, CityState>(
        builder: (context, state) {
          if (state is SuccessCity) {
            return CityListView(
              cities: state.city,
              onPress: (value) => _bloc.add(SelectedCity(city: value)),
            );
          } else if (state is LoadingCity) {
            return Expanded(child: LoadingWidget());
          }
          return Spacer();
        },
        cubit: _bloc,
      ),
    );
  }

  void _gotoHomeScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }
}
