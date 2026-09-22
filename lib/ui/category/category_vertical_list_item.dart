import 'package:dni_ecommerce_v2/config/app_colors.dart';
import 'package:dni_ecommerce_v2/constant/ps_dimens.dart';
import 'package:dni_ecommerce_v2/ui/common/app_ui_widget.dart';
import 'package:dni_ecommerce_v2/viewobject/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryVerticalListItem extends StatelessWidget {
  const CategoryVerticalListItem(
      {Key? key,
      required this.category,
      this.onTap,
      this.animationController,
      this.animation})
      : super(key: key);

  final Category category;

  final Function? onTap;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    animationController!.forward();
    return AnimatedBuilder(
        animation: animationController!,
        child: GestureDetector(
            onTap: onTap as GestureTapCallback,
            child: Card(
                elevation: 0.3,
                child: Container(
                    child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Stack(
                          children: <Widget>[
                            Container(
                                // child: AppNetworkImage(
                                //   photoKey: '',
                                //   defaultPhoto: category.downloadUrl,
                                //   width: AppDimens.space200,
                                //   height: double.infinity,
                                //   boxfit: BoxFit.cover,
                                // ),
                                child: Image.network(
                              category.downloadUrl ?? '',
                              fit: BoxFit.cover,
                            )),
                            Container(
                              width: 200,
                              height: double.infinity,
                              color: AppColors.black!.withAlpha(110),
                            )
                          ],
                        )),
                    Text(
                      category.author,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AppColors.white, fontWeight: FontWeight.bold),
                    ),
                    Container(
                        child: Positioned(
                      bottom: 10,
                      left: 10,
                      child: Container(
                          width: AppDimens.space40,
                          height: AppDimens.space40,
                          child: Image.network(
                            category.downloadUrl ?? '',
                            fit: BoxFit.cover,
                          )
                          // child: PsNetworkCircleIconImage(
                          //   photoKey: '',
                          //   defaultIcon: category.defaultIcon!,
                          //   boxfit: BoxFit.cover,
                          //   onTap: onTap as GestureTapCallback,
                          // ),
                          ),
                    )),
                  ],
                )))),
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
            opacity: animation!,
            child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 100 * (1.0 - animation!.value), 0.0),
                child: child),
          );
        });
  }
}
