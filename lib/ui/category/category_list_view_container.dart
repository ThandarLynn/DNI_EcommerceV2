import 'package:dni_ecommerce_v2/config/app_config.dart';
import 'package:dni_ecommerce_v2/config/app_colors.dart';
import 'package:dni_ecommerce_v2/constant/ps_dimens.dart';
import 'package:dni_ecommerce_v2/constant/route_paths.dart';
import 'package:dni_ecommerce_v2/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'category_list_view.dart';

class CategoryListViewContainerView extends StatefulWidget {
  const CategoryListViewContainerView({this.appBarTitle});

  final String? appBarTitle;
  @override
  _CategoryListWithFilterContainerViewState createState() =>
      _CategoryListWithFilterContainerViewState();
}

class _CategoryListWithFilterContainerViewState
    extends State<CategoryListViewContainerView>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    animationController = AnimationController(
        duration: AppConfig.animation_duration, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Future<bool> _requestPop() {
      animationController!.reverse().then<dynamic>(
        (void data) {
          if (!mounted) {
            return Future<bool>.value(false);
          }
          Navigator.pop(context, true);
          return Future<bool>.value(true);
        },
      );
      return Future<bool>.value(false);
    }

    print(
        '............................Build UI Again ............................');
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        appBar: AppBar(
          // brightness: Utils.getBrightnessForAppBar(context),//lynn
          iconTheme: Theme.of(context)
              .iconTheme
              .copyWith(color: AppColors.mainColorWithWhite),
          title: Text(
            widget.appBarTitle!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.mainColorWithWhite),
          ),
          elevation: 0,
          actions: <Widget>[
            //
          ],
        ),
        body: CategoryListView(),
      ),
    );
  }
}
