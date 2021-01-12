import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papasi/screens/constant.dart';
import 'package:papasi/screens/profile/main/components/rowItem.dart';
import 'package:papasi/screens/profile/transaction_history/main/transaction_screen.dart';
import 'package:papasi/screens/registeration/join_account/join_account_screen.dart';

import 'bloc/profile_bloc.dart';
import 'components/guest_profile.dart';
import 'components/profile_card.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _bloc = ProfileBloc();

  _ProfileScreenState() {
    _bloc.add(FetchProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileStatus) {
                    return ProfileCard(user: state.user);
                  } else if (state is LoadingState) {
                    return Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                      height: 100,
                    );
                  } else if (state is GuestStatus) {
                    return GuestProfileCard(
                        onPress: () => _gotoJoinAccount(context));
                  }
                  return Container();
                },
                cubit: _bloc,
              ),
              _buildAccountCard(),
              _buildGeneralCard(),
              _buildHelpAndSupportCard(),
            ],
          ),
        ));
  }

  Card _buildAccountCard() {
    return Card(
      margin: const EdgeInsets.only(top: 16, bottom: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader("Account"),
            RowItem(title: "Personal Information"),
            RowItem(
              title: "Transaction history",
              onTap: () => _gotoTransactionHistory(context),
            ),
            RowItem(title: "Language"),
            RowItem(title: "Favourites"),
          ],
        ),
      ),
    );
  }

  Card _buildGeneralCard() {
    return Card(
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader("General"),
            SizedBox(height: 8),
            _buildToggle("Notification"),
            _buildToggle("Dark Mode"),
          ],
        ),
      ),
    );
  }

  Card _buildHelpAndSupportCard() {
    return Card(
      margin: const EdgeInsets.only(top: 8, bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader("Help and Supports"),
            RowItem(title: "Prvacy and Security"),
            RowItem(title: "Terms of Condistions"),
            RowItem(title: "About us"),
          ],
        ),
      ),
    );
  }

  Row _buildToggle(String title) {
    return Row(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(color: kTextColor, fontSize: 14),
        ),
        Spacer(),
        Switch(
          value: true,
          onChanged: (value) {},
          activeColor: kPrimery,
        )
      ],
    );
  }

  Text _buildHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        color: kTextColor,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      title: Text(
        "Profile",
        style: TextStyle(
          color: kTextColor,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
    );
  }

  void _gotoJoinAccount(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => JoinAccountScreen(),
      ),
    );
  }

  void _gotoTransactionHistory(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TransactionScreen(),
      ),
    );
  }
}
