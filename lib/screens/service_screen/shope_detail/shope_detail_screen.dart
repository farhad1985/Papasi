import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papasi/domain/model/models.dart';
import 'package:papasi/screens/service_screen/more_offers.dart/more_offers_screen.dart';
import 'package:papasi/screens/service_screen/offer_detail/offer_detail_screen.dart';

import 'bloc/shope_detail_bloc.dart';
import 'components/information_shope_detail.dart';
import 'components/offer_list.dart';
import 'components/review.dart';

class ShopeDetailScreen extends StatefulWidget {
  final ShopeDetail shopeDetail;

  const ShopeDetailScreen({Key key, this.shopeDetail}) : super(key: key);

  @override
  _ShopeDetailScreenState createState() =>
      _ShopeDetailScreenState(shopeDetail: shopeDetail);
}

class _ShopeDetailScreenState extends State<ShopeDetailScreen> {
  final ShopeDetail shopeDetail;
  final _bloc = ShopeDetailBloc();

  var isExpand = false;

  ScrollController _controller;

  _ShopeDetailScreenState({this.shopeDetail});

  @override
  void initState() {
    super.initState();

    _controller = ScrollController()
      ..addListener(() {
        setState(() {
          isExpand = _controller.offset >= 30;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        slivers: <Widget>[
          _buildSliverAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index == 0) {
                  return InformationServiceDetail(
                      shopeDetail: widget.shopeDetail);
                } else if (index == 1) {
                  return _buildOfferList();
                } else if (index == 2) {
                  return Review();
                }
                return Spacer();
              },
              childCount: 3,
              addAutomaticKeepAlives: true,
            ),
          ),
        ],
      ),
    );
  }

  BlocListener<ShopeDetailBloc, ShopeDetailState> _buildOfferList() {
    return BlocListener<ShopeDetailBloc, ShopeDetailState>(
      listener: (context, state) {
        if (state is GotoMoreMoreDetail) {
          _gotoMoreOffers(context, state.offers);
        } else if (state is FailureShopeDetailState) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(state.err),
            ),
          );
        } else if (state is GotoOfferDetail) {
          _gotoOfferDetailScreen(context, state.offer);
        }
      },
      cubit: _bloc,
      child: BlocBuilder<ShopeDetailBloc, ShopeDetailState>(
        builder: (context, state) {
          return OfferList(
            shopeDetail: shopeDetail,
            onPressOffer: (value) => _bloc.add(FetchOneOffer(id: value.id)),
            onPressMore: () => _bloc.add(ViewAllOffers(id: shopeDetail.id)),
          );
        },
        cubit: _bloc,
      ),
    );
  }

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: isExpand ? Colors.white : Colors.grey,
      pinned: true,
      expandedHeight: 100,
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.favorite))],
      iconTheme: IconThemeData(color: isExpand ? Colors.black : Colors.white),
      brightness: isExpand ? Brightness.light : Brightness.dark,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        title: Text(
          shopeDetail.name,
          style: TextStyle(
            color: isExpand ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        centerTitle: true,
        background: Image.asset(
          "assets/images/starbucks_store.png",
          fit: BoxFit.fill,
        ),
      ),
      floating: true,
    );
  }

  void _gotoMoreOffers(BuildContext context, List<Voucher> offers) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MoreOffersScreen(offers: offers),
    ));
  }

  void _gotoOfferDetailScreen(BuildContext context, Offer offer) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => OfferDetailScreen(
        offer: offer,
      ),
    ));
  }
}
